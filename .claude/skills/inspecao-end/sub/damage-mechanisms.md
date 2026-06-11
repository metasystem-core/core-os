# damage-mechanisms.md
# Sub-skill: Biblioteca de Mecanismos de Dano

Consultada quando: identificar mecanismo de dano provável de um equipamento.

## Por família de equipamento e serviço

### Vasos de pressão — serviço geral
- Corrosão uniforme (fluido corrosivo)
- Corrosão por pites (cloretos, água)
- Fadiga térmica (ciclos de temperatura)
- Fluência / creep (alta temperatura > 400°C aço carbono)
- Fragilização por hidrogênio (H₂S, ambientes ácidos)

### Vasos de pressão — serviço H₂S / ácido
- HIC (Hydrogen Induced Cracking)
- SOHIC (Stress Oriented HIC)
- SSC (Sulfide Stress Cracking)

### Tubulações — processo
- Erosão-corrosão (fluido com partículas, alta velocidade)
- Corrosão externa (isolamento molhado, solo)
- Fadiga por vibração
- CUI (Corrosion Under Insulation)

### Estruturas metálicas
- Fadiga (cargas cíclicas, vento)
- Corrosão atmosférica
- Fragilização por temperatura baixa

### Cabos e acessórios de içamento
- Fadiga por flexão repetida
- Corrosão de arames internos
- Desgaste por abrasão
- Deformação plástica por sobrecarga

## Fatores de risco

| Fator | Mecanismo acelerado |
|---|---|
| Temperatura > 60°C | Corrosão, fluência |
| Cloretos | Pites, SCC em inox |
| H₂S | HIC, SSC, SOHIC |
| Cargas cíclicas | Fadiga |
| Fluido com partículas | Erosão |
| Isolamento molhado | CUI |

## Saída esperada

Dado o equipamento, fluido e condições: listar mecanismos prováveis
em ordem de probabilidade + justificativa + técnica END indicada.
