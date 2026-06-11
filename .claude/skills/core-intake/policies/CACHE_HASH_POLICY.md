# Política — Cache e SHA-256

## Regra
Todo arquivo deve receber SHA-256.

## Classificação por hash
- mesmo hash = duplicata exata;
- hash diferente + mesmo nome = possível versão diferente;
- mesmo título + edição diferente = versão nova;
- mesmo tema + fonte diferente = material relacionado/conflito potencial.

## Reprocessamento
Não reprocessar arquivo com hash já conhecido, salvo:
- schema mudou;
- usuário pediu reprocessamento;
- ingestão anterior falhou;
- arquivo foi marcado como crítico;
- lacuna de rastreabilidade exige nova leitura.
