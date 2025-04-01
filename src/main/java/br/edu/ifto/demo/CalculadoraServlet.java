package br.edu.ifto.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/calculadora")
public class CalculadoraServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            double num1 = Double.parseDouble(request.getParameter("numero1"));
            double num2 = Double.parseDouble(request.getParameter("numero2"));
            String[] operacoes = request.getParameterValues("operacao");

            StringBuilder resultados = new StringBuilder();

            if (operacoes != null && operacoes.length > 0) {
                for (String operacao : operacoes) {
                    switch (operacao) {
                        case "somar":
                            resultados.append(String.format("%.2f + %.2f = %.2f", num1, num2, (num1 + num2))).append("<br>");
                            break;
                        case "subtrair":
                            resultados.append(String.format("%.2f - %.2f = %.2f", num1, num2, (num1 - num2))).append("<br>");
                            break;
                        case "multiplicar":
                            resultados.append(String.format("%.2f * %.2f = %.2f", num1, num2, (num1 * num2))).append("<br>");
                            break;
                        case "dividir":
                            if (num2 != 0) {
                                resultados.append(String.format("%.2f / %.2f = %.2f", num1, num2, (num1 / num2))).append("<br>");
                            } else {
                                resultados.append("Divisão por zero não é permitida").append("<br>");
                            }
                            break;
                    }
                }
            } else {
                resultados.append("Nenhuma operação selecionada");
            }

            request.setAttribute("resultados", resultados.toString());

        } catch (NumberFormatException e) {
            request.setAttribute("resultados", "Por favor, insira números válidos");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}