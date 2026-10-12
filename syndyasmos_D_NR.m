function [output1, output2, output3, output4, out, out1, out2] = syndyasmos_D_NR(f, df, a, b, tol, n)
    % Συνδυασμός μεθόδου Διχοτόμησης και Newton-Raphson

    % Έλεγχος για τη μέθοδο διχοτόμησης
    if f(a) * f(b) > 0
        error('Η συνάρτηση έχει το ίδιο πρόσημο στα δύο άκρα του διαστήματος [a, b].');
    end

    % Αρχικοποίηση για τη μέθοδο διχοτόμησης
    a(1) = a;
    b(1) = b;
    i = 1;
    abs_errors_bisect = NaN(1, n); % Πίνακας για απόλυτα σφάλματα
    rel_errors_bisect = NaN(1, n); % Πίνακας για σχετικά σφάλματα
    prev_abs_err_bisect = NaN;

    % Επανάληψη για τη μέθοδο διχοτόμησης
    while i <= n
        c(i) = (a(i) + b(i)) / 2;
        
        % Έλεγχος για σύγκλιση
        if abs(f(c(i))) < tol
            break;
        end
        
        % Υπολογισμός απόλυτου και σχετικού σφάλματος από τη 2η επανάληψη
        if i > 1
            abs_err_bisect = abs(c(i) - c(i - 1));
            abs_errors_bisect(i) = abs_err_bisect; % Αποθήκευση απόλυτου σφάλματος
            
            if ~isnan(prev_abs_err_bisect) && prev_abs_err_bisect ~= 0
                rel_err_bisect = abs_err_bisect / prev_abs_err_bisect; % Σχετικό σφάλμα
                rel_errors_bisect(i) = rel_err_bisect; % Αποθήκευση σχετικού σφάλματος
            end
            prev_abs_err_bisect = abs_err_bisect;
        end
        
        % Ενημέρωση διαστημάτων
        if f(a(i)) * f(c(i)) < 0
            a(i + 1) = a(i);
            b(i + 1) = c(i);
        else
            a(i + 1) = c(i);
            b(i + 1) = b(i);
        end
        
        i = i + 1;
    end
    
    % Καθορισμός των επαναλήψεων που έγιναν
    if i > n
        k = 1:n;
    else
        k = 1:i;
    end
    
    % Παροχή των αποτελεσμάτων
    output1 = [k', a(k)', b(k)', c(k)', f(c(k))'];
    output2 = c(i);
    output3 = abs_errors_bisect(k)';
    output4 = rel_errors_bisect(k)';

    % Χρησιμοποίηση της εκτίμησης της διχοτόμησης για την Newton-Raphson
    x(1) = c(i);
    i = 2;
    tol = 1/2 * 10^-6;
    abs_errors_NR = NaN(1, n); % Πίνακας για απόλυτα σφάλματα
    rel_errors_NR = NaN(1, n); % Πίνακας για σχετικά σφάλματα
    prev_abs_err_NR = NaN;

    while i <= n
        % Υπολογισμός της νέας προσέγγισης
        x(i) = x(i-1) - f(x(i-1)) / df(x(i-1));
        
        % Υπολογισμός του απόλυτου σφάλματος
        abs_err_NR = abs(x(i) - x(i - 1));
        abs_errors_NR(i) = abs_err_NR;
        
        % Υπολογισμός του σχετικού σφάλματος από τη 2η επανάληψη
        if i > 2 && prev_abs_err_NR ~= 0
            rel_err_NR = abs_err_NR / prev_abs_err_NR;
            rel_errors_NR(i) = rel_err_NR;
        end
        
        prev_abs_err_NR = abs_err_NR;
        
        % Έλεγχος για σύγκλιση
        if abs(f(x(i))) < tol
            break;
        end
        
        i = i + 1;
    end
    
    % Καθορισμός των επαναλήψεων που έγιναν
    if i > n
        k = 1:n;
    else
        k = 1:i;
    end
    
    % Παροχή των αποτελεσμάτων
    out = [k', x(k)', f(x(k))'];
    out1 = abs_errors_NR(k)';
    out2 = rel_errors_NR(k)';
end
