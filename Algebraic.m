function R = Algebraic(nume, d)
  % folosesc aceeasi implementare ca la "Iterative" pana calculez M
	% deschid fisierul de input 
  input = fopen(nume, 'r');
  nods = fscanf(input, '%d', 1);
  A = zeros(nods);
  K = zeros(nods);

  % citesc listele cu vecini din fisier si construiesc
  % matricea de adiacenta A
  for i = 1 : nods
    l = fscanf(input, '%d', 1);
    nr = fscanf(input, '%d', 1);
    self_link = 0;
    % citesc vecinii si completez matricea A
    for j = 1 : nr
      c = fscanf(input, '%d', 1);
      A(l, c) = 1;
    endfor
    % daca pagina are link spre ea insasi nu adaug la numarare    
    if A(i, i) != 0
      A(i, i) = 0;
      self_link = -1;     
    endif
    % self_link o sa inlature linkul la aceeasi pagina daca are
    % K este matricea diagonala ce retine numarul de linkuri externe
    % al fiecarui nod
    K(i, i) = nr + self_link;
  endfor
 
  % citesc ultimele 2 valori si inchid fisierul
  val1 = fscanf(input, '%f', 1);
  val2 = fscanf(input, '%f', 1);
  fclose(input);
 
  % calculez matricea M dupa formula
  M = (PR_Inv(K) * A)';
  
  one_col = ones(nods, 1);
  I = eye(nods);  
  % calculez R dupa formula
  inv_GS = PR_Inv(I - d * M);
  R = inv_GS * (1 - d ) / nods * one_col; 
  
endfunction
	