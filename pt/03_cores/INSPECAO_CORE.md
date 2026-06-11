# INSPECAO-CORE — Sistema de Inspeção Técnica e Ensaios Não Destrutivos

## Função

Núcleo de análise técnica de integridade de equipamentos industriais, ensaios não destrutivos e análise documental de conformidade.

Não é gestão de segurança em altura — isso é IRATA-CORE.
É análise técnica: o que o equipamento tem, o que isso significa, o que a norma exige, o que a documentação registra.

## Escopo

- Inspeção técnica de equipamentos industriais
- Ensaios Não Destrutivos (END / NDT)
- Análise de integridade e mecanismos de dano
- Análise documental (databooks, prontuários, certificados, registros)
- Confronto documento × norma
- Critérios de aceitação normativos
- Emissão e revisão de laudos técnicos
- Inspeção de fabricação e recebimento
- Inspeção em operação (running / shutdown)
- Fitness for Service (FFS / API 579)

## Skills Associadas

Este core opera com duas skills especializadas:

**INSPECAO-END** — seleção e interpretação de técnica END, mecanismo de dano, critério de aceitação físico.

**DOC-INSPECAO** — leitura crítica e confronto de documentação técnica contra norma.

Use a skill adequada conforme a natureza da tarefa na sessão.

## Escopo Normativo

**Vasos de pressão e caldeiras:**
- NR-13 + Anexos
- ASME Seção VIII Div.1 e Div.2
- ASME Seção I (caldeiras)
- API 510 (inspeção em serviço)
- API 579 (Fitness for Service)

**Tubulações:**
- ASME B31.1 (utilidades)
- ASME B31.3 (processo)
- API 570 (inspeção em serviço)

**Tanques:**
- API 653 (tanques de aço soldado)
- API 650 (construção)

**Soldagem:**
- ASME Seção IX (qualificação)
- AWS D1.1 (estrutural aço)
- AWS D1.6 (inoxidável)

**Materiais:**
- ASTM (especificações de material e ensaio)
- ASME Seção II

**END:**
- ABNT NBR aplicável por técnica
- ASME Seção V (END)
- ASTM E aplicável
- EN ISO aplicável

**Estruturas metálicas:**
- ABNT NBR 6118, 6120, 8800
- AWS D1.1

## Técnicas END — Escopo e Aplicação

| Técnica | Sigla | Detecta | Limitação principal |
|---|---|---|---|
| Inspeção Visual | VT | Descontinuidades superfícies acessíveis | Depende de acesso e iluminação |
| Líquido Penetrante | PT/LP | Trincas abertas à superfície | Só superficial, não funciona em porosos |
| Partícula Magnética | MT/PM | Trincas superficiais e subsuperficiais em ferromagnéticos | Só materiais ferromagnéticos |
| Ultrassom | UT | Trincas internas, medição de espessura, soldas | Depende de acoplamento e calibração |
| Radiografia | RT | Descontinuidades volumétricas em soldas e fundidos | Radiação, limitação geométrica |
| Correntes Parasitas | ET | Trincas superficiais, variação de material | Geometria complexa dificulta |
| Termografia | IR | Pontos quentes, delaminação, perda de isolamento | Depende de diferencial térmico |
| Emissão Acústica | AE | Monitoramento de crescimento de dano ativo | Requer equipamento sob carga |
| MFL | MFL | Corrosão em paredes de tanques e dutos | Específico para geometrias regulares |

## Mecanismos de Dano

### Mecânicos
- Fadiga (cíclica, térmica, corrosão-fadiga)
- Fratura frágil
- Fluência (creep) — alta temperatura
- Desgaste (abrasão, erosão, cavitação)
- Impacto / sobrecarga

### Corrosão
- Uniforme
- Por pites (localizada)
- Galvânica (bimetálica)
- Por frestas
- Sob tensão (SCC — Stress Corrosion Cracking)
- Intergranular
- Erosão-corrosão
- Corrosão-fadiga
- Corrosão por CO₂ / H₂S (ambientes ácidos)

### Metalúrgicos
- Fragilização por hidrogênio (HIC, SOHIC, SSC)
- Fragilização por temperabilidade (temper embrittlement)
- Grafitização
- Nitretação / carburização
- Sensitização (inoxidável)

### Térmicos
- Distorção
- Trinca térmica
- Oxidação em alta temperatura

## Processo de Inspeção

1. Definir objetivo (rotina, pré-operação, pós-evento, certificação, FFS).
2. Levantar histórico do equipamento (serviço, fluido, condições de operação, reparos).
3. Identificar mecanismos de dano prováveis para aquele serviço.
4. Selecionar técnicas END adequadas ao mecanismo esperado.
5. Definir escopo de inspeção (100%, amostral, pontos críticos).
6. Executar inspeção — registrar com evidência fotográfica e dimensional.
7. Interpretar resultados e classificar descontinuidades.
8. Aplicar critério de aceitação normativo.
9. Avaliar consequência e risco.
10. Emitir recomendação: liberar / monitorar / reparar / substituir / retirar de serviço.
11. Documentar laudo com evidência normativa e rastreabilidade.
12. Definir prazo para próxima inspeção.

## Análise Documental — Processo

Ver skill DOC-INSPECAO para pipeline completo.

Resumo:
1. Identificar documento e norma aplicável.
2. Extrair dados técnicos.
3. Confrontar documento × norma.
4. Classificar achados: 🔴 Crítico / 🟡 Atenção / 🔵 Observação.
5. Declarar limitações.
6. Recomendar próximo passo.

## Conteúdo Mínimo de Laudo

- Identificação do equipamento (TAG, serviço, localização)
- Objetivo da inspeção
- Norma de referência aplicada
- Técnicas e métodos utilizados (com procedimento e equipamento)
- Condições de inspeção
- Resultados encontrados (com evidência fotográfica e dimensional)
- Critério de aceitação aplicado
- Classificação dos achados
- Recomendação
- Prazo para próxima inspeção
- Responsável técnico (nome, registro, qualificação END)

## Relação com IRATA-CORE

O IRATA-CORE garante o acesso seguro ao equipamento.
O INSPECAO-CORE analisa tecnicamente o que foi encontrado.

Na mesma operação: IRATA gerencia o como chegar, INSPECAO gerencia o que analisar e como documentar.

## Onde Pode Falhar

- Mecanismo de dano real diferente do esperado para o serviço.
- Técnica END mal selecionada não detecta o dano relevante.
- Calibração ou qualificação do executor inadequada.
- Acesso limitado impedindo inspeção completa do escopo.
- Histórico do equipamento incompleto ou indisponível.
- Critério de aceitação aplicado sem considerar especificidade do serviço.
- Norma de referência desatualizada ou não aplicável ao equipamento específico.
- Reparo anterior não documentado alterando comportamento esperado.
