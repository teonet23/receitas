<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro  de Despesa</title>
    <link rel="stylesheet" href="style.css/style.css">
</head>
<body>
    <div align="center"><h3>Cadastro de Despesa</h3></div>
    <div align="center">
        <a href="index.html">Voltar</a> &nbsp;&nbsp;
        <br>
    </div>
    <?php
        require_once "php/Conexao.php";
        require_once "php/classes/conta.php";
        require_once "php/classes/TipoDespesa.php";

    ?>
    <div align="center">
        <form method="POST" action="php/cadastro_de_despesa.php">
            <div align="center">
                Valor da Despesa:
                <br>
                <input type="text" id="txtValor" name="txtValor"/>
            </div>
            <div align="center">
                Data de Recebimento:
                <br>
                <input type="text" id="txtDatarecebimento" name="txtDatarecebimento"/>
            </div>
            <div>
                Emitente:
                </br>
                <input type="text" id="txtEmitente" name="txtEmitente"/>
            </div>
            <div>
                <div align="center">
                    Descrição:
                    <br>
                    <input type="text" id="txtDescricao" name="txtDescricao"/>
            </div>
            <div>
                <input type="checkbox" id="chkPago" name="chkPago"/>Pago
            </div>
            <div align="center">
                Tipo de Despesa:
                <br>
                <select id="selTipodespesa" name="selTipodespesa">
                    <?php
                        $tipodespesa = new TipoDespesa();
                        $lista = $tipodespesa->Listar();

                        while($registro = $lista->fetch_assoc())
                        {
                            echo '<option value="'. $registro['id'] . '">' . $registro['nome'] .'</option>';
                        }


                    ?>
                   
                </select>
            <br>
            </div>
            <div>
                 Conta:
                <br>
                <select name="selConta" id="selConta">
                    <?php
                        $conta = new Conta();

                        $lista = $conta->Listar();

                        while($registro = $lista->fetch_assoc())
                        {
                            echo '<option value="';
                            echo $registro['id'];
                            echo '">';
                            echo $registro['nome'];
                            echo '</option>';
                        }

                    ?>
                   
                </select>
            </div>
            <br>
            <div>
                <input type="reset" value="Limpar">
                &nbsp;
                <input type="submit" value="Enviar">
            <br>
            </div>


        </form>
    </div>
</body>