function [] = plot_graph(f, df)
    % Διάστημα για τις τιμές του x
    x = -10:0.01:10;
    
    % Υπολογισμός των τιμών της συνάρτησης f στο x
    y_f = f(x); % Τιμές της f(x) για γραφική παράσταση
    
    % Δημιουργία πίνακα για τις τιμές Newton-Raphson (y2)
    y2 = zeros(size(x));
    y2(1) = x(1); % Αρχική προσέγγιση (πρώτη τιμή x)

    % Εφαρμογή μεθόδου Newton-Raphson
    for i = 2:length(x)
        y2(i) = y2(i-1) - f(y2(i-1)) / df(y2(i-1));
    end

    % Γραφική παράσταση
    figure;
    plot(x, y_f, 'r-', 'LineWidth', 1.5); % Συνάρτηση f(x) σε κόκκινο
    hold on;
    plot(x, y2, 'b-*', 'MarkerSize', 2); % Τιμές Newton-Raphson σε μπλε
    hold off;

    xlabel('Άξονας x', 'FontName', 'Arial', 'FontSize', 10);
    ylabel('Άξονας y', 'FontName', 'Arial', 'FontSize', 10);
    title('Γραφικές Παραστάσεις f(x) και Newton-Raphson', 'FontSize', 10);
    legend('f(x)', 'Newton-Raphson', 'Location', 'northeast');
end
