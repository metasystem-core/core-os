# SKILL — equip-norm-mapper

## Identidade

`equip-norm-mapper` identifica normas candidatas, confirmadas ou condicionais a partir do equipamento, atividade, ambiente, risco ou documento apresentado pelo operador.

Ela existe para quando o operador:

- não informar a norma;
- não souber qual norma se aplica;
- trouxer documentação incompleta;
- trouxer descrição de campo sem enquadramento normativo;
- pedir verificação de cobertura normativa.

## Regra central

Inferir norma aplicável não é confirmar norma aplicável.

A confirmação exige dados mínimos do equipamento, atividade, ambiente, energias/risco, documentação e escopo contratual.

## Fluxo obrigatório

1. Extrair entidades do input:
   - equipamento;
   - atividade;
   - ambiente;
   - risco;
   - documento;
   - produto/material;
   - método de ensaio;
   - função da equipe.
2. Consultar `equipment_norm_maps/base_equipment_to_norms.yaml`.
3. Consultar perfis normativos de `irata-n3` e `inspecao-end`.
4. Classificar normas como:
   - aplicável confirmada;
   - possivelmente aplicável;
   - condicional;
   - não aplicável pelo dado atual;
   - lacuna.
5. Listar dados faltantes.
6. Encaminhar para o core correto.

## Saída obrigatória

```yaml
equipamento_detectado:
atividade_detectada:
ambiente_detectado:
normas_confirmadas:
normas_possiveis:
normas_condicionais:
dados_faltantes:
grau_de_certeza:
core_recomendado:
observacao:
```

## Exemplos de separação de domínio

### Caso IRATA-N3

Entrada: equipe em acesso por cordas para inspeção externa em tanque.

Saída:

- `irata-n3`: NR-35, IRATA ICOP/TACS, plano de resgate, ancoragem, rastreabilidade, comunicação, isolamento.
- `inspecao-end`: normas de inspeção do tanque, se a pergunta envolver integridade/equipamento.
- `doc-inspecao`: documentação, certificados e evidências.

### Caso Inspeção-END

Entrada: vaso de pressão com medição de espessura e prontuário incompleto.

Saída:

- `inspecao-end`: NR-13, API 510, ASME, critérios de integridade, END.
- `doc-inspecao`: prontuário, certificado, relatório, evidência documental.
- `irata-n3`: somente se houver trabalho em altura/acesso por cordas.

## Bloqueios

Bloquear conclusão normativa se:

- equipamento não foi identificado;
- atividade não foi identificada;
- norma candidata depende de dado ausente;
- versão/vigência não foi confirmada;
- a pergunta pede liberação crítica sem evidência.
