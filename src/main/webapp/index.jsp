<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora Multioperacional</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .operations {
            margin: 15px 0;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .results {
            margin-top: 20px;
            padding: 15px;
            background-color: #e9f7ef;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Calculadora</h1>
    <form action="${pageContext.request.contextPath}/calculadora" method="post">
        <div class="form-group">
            <label for="numero1">Número 1:</label>
            <input type="number" step="any" id="numero1" name="numero1" required>
        </div>

        <div class="form-group">
            <label for="numero2">Número 2:</label>
            <input type="number" step="any" id="numero2" name="numero2" required>
        </div>

        <div class="operations">
            <p>Selecione as operações:</p>
            <label><input type="checkbox" name="operacao" value="somar"> Somar</label><br>
            <label><input type="checkbox" name="operacao" value="subtrair"> Subtrair</label><br>
            <label><input type="checkbox" name="operacao" value="multiplicar"> Multiplicar</label><br>
            <label><input type="checkbox" name="operacao" value="dividir"> Dividir</label>
        </div>

        <button type="submit" class="btn">Calcular</button>
    </form>

    <%-- Exibe os resultados --%>
    <% if (request.getAttribute("resultados") != null) { %>
    <div class="results">
        <h3>Resultados:</h3>
        <p>${resultados}</p>
    </div>
    <% } %>
</div>
</body>
</html>