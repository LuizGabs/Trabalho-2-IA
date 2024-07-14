% Definindo as probabilidades das variáveis
% a condição da rua (str) pode ser dry, wet ou snow_covered
0.81::str(dry).
0.09::str(wet).
0.1::str(snow_covered).
% A variavel flw representa o volante do dinamo desgastado
0.41::flw. % 0.59 é o complemento, a parte falsa que fica implicita
% Probabilidades condicionais de R (dínamo deslizante) dadas Str
% (condicão da rua) e Flw (volante desgastado)
0.49::r :- str(dry), flw.
0.01::r :- str(dry), \+flw.
0.69::r :- str(wet), flw.
0.31::r :- str(wet), \+flw.
0.49::r :- str(snow_covered), flw.
0.86::r :- str(snow_covered), \+flw.
% Probabilidades condicionais de V (voltagem) dada R (dínamo deslizante)
0.02::v :- r.
0.96::v :- \+r.
% definindo as probabilidades das outras variáveis
% B (lâmpada ok) e K (cabo ok)
0.98::b.
0.19::k.
% Probabilidades finais da luz ligada (Li) dadas V, B, e K influenciando diretamente Li.
0.99::li :- v, b, k.
0.01::li :- v, b, \+k.
0.01::li :- v, \+b, k.
0.001::li :- v, \+b, \+k.
0.3::li :- \+v, b, k.
0.005::li :- \+v, b, \+k.
0.005::li :- \+v, \+b, k.
0.0::li :- \+v, \+b, \+k.
% Evidência de que a condição da rua é snow_covered
evidence(str(snow_covered)).

% Consultas para calcular a probabilidade de V (voltagem)
query(v).

% teremos então como resposta, a probabilidade de V, dado que a rua está coberta de neve.
