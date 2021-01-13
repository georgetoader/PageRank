function [R1 R2] = PageRank(nume, d, eps)
  input = fopen(nume,'r');
  nods = fscanf(input, '%d',1);
  % parcurg fisierul pentru a ajunge la ultimele 2 elemente
  val1 = 0;
  val2 = 0;
  while ((test = fscanf(input, "%f", 1)))
    val1 = val2;
    val2 = test;
  endwhile 
  fclose(input);

  % creez fisierul de output ca in cerinta
  out_name = strcat(nume, '.out');  
  output = fopen(out_name, 'w');
 
  % scriu numarul de pagini web
  fprintf(output, '%d\n', nods);
  fprintf(output, '\n');
 
  % calculez PR folosind "Iterative" si scriu in fisier
  R1 = Iterative(nume, d, eps);
  fprintf(output, '%.6f\n', R1);
  fprintf(output, '\n');

  % calculez PR folosind "Algebraic" si scriu in fisier
  R2 = Algebraic(nume, d);
  fprintf(output, '%.6f\n', R2);
  fprintf(output, '\n');

  % sortez descrescator vectorul R2 obtinut din "Algebraic"
  [PR, pos] = sort(R2, 'descend');
  for i = 1 : nods
    % calculez functia si scriu in fisier
    res = Apartenenta(PR(i), val1, val2);
    fprintf(output, '%d %d %.6f', i, pos(i), res);
    if i != nods
      fprintf(output, '\n');
    endif
  endfor
  fclose(output);
  
endfunction