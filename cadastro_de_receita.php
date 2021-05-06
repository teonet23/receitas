<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Receita</title>
    <link rel="stylesheet" href="style.css/style.css">
</head>
<body>
    <div align="center"><h3>Cadastro de Receita</h3></div>
    <div align="center">
        <a href="index.html">Voltar</a> &nbsp;&nbsp;
        <br>
    </div>
    <?php
        require_once "php/Conexao.php";
        require_once "php/classes/conta.php";
        require_once "php/classes/TipoReceita.php";

    ?>
    <div align="center">
        <form method="POST" action="php/cadastro_de_receita.php">
            <div align="center">
                Valor da Receita:
                <br>
                <input type="text" id="txtValor" name="txtValor"/>
            </div>
            <div align="center">
                Data do Recebimento:
                <br>
                <input type="text" id="txtDatarecebimento" name="txtDatarecebimento"/>
            </div>
            <div align="center">
                Emitente:
                <br>
                <input type="text" id="txtEmitente" name="txtEmitente"/>
            </div>
            <div align="center">
                Descricao:
                <br>
                <input type="text" id="txtDescricao" name="txtDescricao"/>
            </div>
            <div align="center">
                Tipo de Receita:
                <br>
                <select id="selTipoReceita" name="selTipoReceita">
                    <?php
                        $tiporeceita = new TipoReceita();
                        $lista = $tiporeceita->Listar();

                        while($registro = $lista->fetch_assoc())
                        {
                            echo '<option value="'. $registro['id'] . '">' . $registro['nome'] .'</option>';
                        }


                    ?>
                   
                </select>
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
               </div>
            <br>
            </div>

        </form>
</body>
</html>