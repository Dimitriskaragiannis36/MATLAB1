% Ορισμός των παραμέτρων
f1 = @(x) (x + 1).^3 .* (x - 2); 
df1 = @(x) (x + 1).^2 .* (4.*x - 5);
a1 = -2;
b1 = 0;
tol = 1/2 * 10^-2;
n = 50;

% Κλήση για f1 με συνδυαστική μέθοδο Διχοτόμησης - NR
plot_graph(f1, df1); % Διάγραμμα της συνάρτησης και της προσέγγισης NR
[out_bm_1, out_bm_2, out_bm_3, out_bm_4, out_nr_1, out_nr_2, out_nr_3] = syndyasmos_D_NR(f1, df1, a1, b1, tol, n);

% Νέα συνάρτηση f2 και η παράγωγός της για δεύτερο σετ παραμέτρων
f2 = @(x) exp(x) - x.^2 - 2;
df2 = @(x) exp(x) - 2.*x;
a2 = 0;
b2 = 2;

% Κλήση για f2 με συνδυαστική μέθοδο Διχοτόμησης - NR
plot_graph(f2, df2); % Διάγραμμα της συνάρτησης και της προσέγγισης NR
[out_bm_1, out_bm_2, out_bm_3, out_bm_4, out_nr_1, out_nr_2, out_nr_3] = syndyasmos_D_NR(f2, df2, a2, b2, tol, n);

% Κλήση για f1 με συνδυαστική μέθοδο Διχοτόμησης - Τέμνουσας
[out_bm2_1, out_bm2_2, out_bm2_3, out_bm2_4, out_tm_1, out_tm_2, out_tm_3] = syndyasmos_D_T(f1, a1, b1, tol, n)

% Κλήση για f2 με συνδυαστική μέθοδο Διχοτόμησης - Τέμνουσας
[out_bm2_1, out_bm2_2, out_bm2_3, out_bm2_4, out_tm_1, out_tm_2, out_tm_3] = syndyasmos_D_T(f2, a2, b2, tol, n)

disp('Πάτησε Enter για κλείσιμο...');
pause
