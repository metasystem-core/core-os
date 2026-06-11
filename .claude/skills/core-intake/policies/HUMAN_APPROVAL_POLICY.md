# Política — Aprovação humana proporcional

## Não precisa aprovação para
- criar manifest;
- calcular hash;
- classificar preliminarmente;
- criar fila de processamento;
- mover arquivo para quarentena temporária por erro;
- sugerir destino.

## Precisa aprovação para
- mover grande lote;
- apagar;
- sobrescrever;
- merge;
- marcar versão como substituída;
- classificar conflito crítico;
- usar documento como fonte forte;
- expor conteúdo privado;
- editar SKILL.md de forma estrutural.

## Regra
Automatizar o trivial.
Pedir aprovação no irreversível, crítico ou ambíguo.
