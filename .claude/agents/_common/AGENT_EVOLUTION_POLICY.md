# AGENT EVOLUTION POLICY — Política de Evolução de Agentes
**Versão:** 0.1-draft | **Data:** 2026-06-09
**Escopo:** política de elevação de dado → memória → conhecimento → persona

---

## Princípio

> A evolução de um agente deve ser tão cuidadosa quanto a evolução de uma pessoa:
> lenta, verificada, reversível e governada.

O sistema aprende. Mas o sistema não aprende sozinho.
Toda elevação de camada exige filtro, recorrência, validação, QA, versionamento e governança.

---

## 1. A cadeia de elevação

```
DADO BRUTO
  ↓ filtro: relevância + recorrência + confiança
MEMÓRIA EPISÓDICA
  ↓ filtro: validação + padrão estrutural + utilidade futura
CONHECIMENTO ESTÁVEL
  ↓ filtro: QA + FW-CORE + versionamento + aprovação do operador
PERSONA (atualização formal)
```

Cada camada tem critérios de entrada e filtros de passagem.
Nada sobe de camada automaticamente.

---

## 2. Dado → Memória episódica

Um dado se torna candidato a memória quando:

- [ ] Ocorreu em contexto operacional real (não hipotético)
- [ ] Tem relevância para sessões futuras
- [ ] Não é redundante com memória existente
- [ ] Não é dado sensível sem classificação

O agente marca como `memory_candidate` — não eleva diretamente.

**O que não vira memória:**
- dado único sem relevância futura;
- impulso passageiro do operador;
- ruído de conversação;
- inferência sem suporte.

---

## 3. Memória → Conhecimento estável

Uma memória se torna candidata a conhecimento quando:

- [ ] Apareceu em múltiplas sessões (recorrência mínima: 3 ocorrências sugeridas)
- [ ] Consistente entre ocorrências (não contraditória)
- [ ] Passou por validação do operador em pelo menos uma instância
- [ ] Tem valor operacional — muda comportamento do agente de forma útil
- [ ] Não conflita com conhecimento já estabelecido

Conhecimento candidato passa por:
1. HARVEST-CORE → classifica e propõe elevação
2. FW-CORE → verifica coerência constitucional
3. QA → testa em cenários controlados
4. Versionamento → registra mudança com changelog

---

## 4. Conhecimento → Atualização de Persona

Uma atualização de persona é o nível mais alto de mudança.

Critérios:
- [ ] O conhecimento acumulado muda fundamentalmente como o agente opera
- [ ] A mudança foi observada como positiva em uso real
- [ ] A mudança não viola a missão original do agente
- [ ] Existe proposta formal: `candidate_persona_update`

### Processo obrigatório:

```
1. Gerar candidate_persona_update (agente ou HARVEST-CORE)
2. FW-CORE revisa coerência constitucional
3. QA testa o agente com a persona nova em cenários controlados
4. Versionamento registra: from_version → to_version + changelog
5. Operador primário aprova
6. Deploy da nova persona
7. Monitoramento por [N sessões] antes de consolidar
```

**Rollback:** se a nova persona degradar performance ou violar constituição, reverter para from_version.

---

## 5. Proibições absolutas

- [ ] Persona não muda no calor da interação por pressão do usuário
- [ ] Memória não pode ser injetada externamente sem validação
- [ ] Conhecimento não pode ser elevado sem recorrência verificada
- [ ] Operador visitante não pode calibrar persona (exclusivo do primário)
- [ ] Agente não pode auto-elevar sem passar pelos filtros
- [ ] Nenhum dado sobe para persona em menos de 3 ocorrências verificadas
- [ ] Drift gradual sem registro é violação — toda mudança deve ter rastro

---

## 6. Drift de persona — o que é e por que proibir

Drift de persona é a mudança gradual e não registrada do comportamento do agente
sob influência acumulada de interações sem filtro.

É insidioso porque:
- Acontece devagar, invisível
- Parece adaptação inteligente
- Mas é contaminação sem controle

Como prevenir:
- Todo candidato a mudança de comportamento é registrado, não absorvido diretamente
- Watchdog local detecta mudança de tom ou escopo não autorizada
- FW-CORE revisa periodicamente se o agente opera conforme a persona declarada

---

## 7. Memória suja — o que é e por que proibir

Memória suja é memória que:
- Contém dado não verificado tratado como fato
- Contradiz conhecimento estabelecido sem resolução
- É resultado de impulso passageiro, não de padrão real
- Inclui dado sensível sem classificação

Memória suja contamina decisões futuras.
Um agente com memória suja toma decisões ruins com confiança errada.

Protocolo de limpeza:
- Revisão periódica das memórias de cada agente
- Candidatos a descarte marcados e aguardam confirmação do operador
- Nunca apagar memória relevante sem rollback disponível

---

## 8. Alteração automática de autoridade — proibido

Nenhum agente pode expandir sua autoridade por:
- uso recorrente;
- confiança crescente do operador;
- acumulação de memória.

Autoridade é atributo da arquitetura — definida no schema e governada pelo FW-CORE.
Autoridade muda via processo formal: proposta → FW-CORE → QA → versioning → aprovação.

---

## 9. Frase constitucional

> O agente que aprende sem governança
> é o agente que deriva sem destino.
