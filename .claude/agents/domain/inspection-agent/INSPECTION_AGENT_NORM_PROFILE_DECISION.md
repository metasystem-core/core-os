---
document_id: inspection-agent-norm-profile-decision
agent: inspection-agent
version: "1.0"
created: "2026-06-10"
iteration: "7.1b"
event: "EVT-20260610-035"
status_agent: draft
active_agent: false
---

# DECISÃO — norm_profile.yaml Canônico para inspection-agent

> **Documento de decisão arquitetural.**
> Registra qual `norm_profile.yaml` é canônico para o `inspection-agent`, com justificativa e riscos.
> **Não altera status do agente. Não promove. Não ativa.**

---

## 1. Arquivos Localizados

| Caminho | Versão | Tamanho | Data de modificação | Função aparente |
|---|---|---|---|---|
| `.claude/skills/inspecao-end/norm_profile.yaml` | 2026-05-11 | 4.6 KB | 2026-05-11 07:42 | **Perfil ativo — canônico** |
| `.claude/skills/irata-n3/norm_profile.yaml` | — | — | — | Perfil de irata-n3 — domínio separado, não relevante aqui |
| `_staging/norm_patch_extract/.claude/skills/inspecao-end/norm_profile.yaml` | 2026-05-10 | 2.6 KB | 2026-05-10 21:11 | Versão pré-instalação do patch normativo — artefato histórico |
| `_staging/norm_patch_extract/.claude/skills/irata-n3/norm_profile.yaml` | — | — | — | Versão de staging do irata-n3 — não relevante aqui |

---

## 2. Contexto do Staging

O diretório `_staging/norm_patch_extract/` contém o **pacote original do Patch Normativo Leve** (versão 2026-05-10), conforme documentado em:
- `_staging/norm_patch_extract/README.md`
- `_staging/norm_patch_extract/PATCH_NOTES.md`

**O que esse pacote era:**
Um patch de instalação que adicionou capacidade normativa ao CORE-OS: ingestão de normas públicas e privadas autorizadas, segmentação em blocos, mapeamento equipamento→norma, tradução. A versão 2026-05-10 do `norm_profile.yaml` era o arquivo incluído no pacote antes da instalação.

**O que aconteceu após a instalação:**
O arquivo root `.claude/skills/inspecao-end/norm_profile.yaml` foi atualizado para versão 2026-05-11 (1 dia após a data do patch), incorporando:
- NR-14, NR-15, NR-22, NR-34 (ausentes no staging)
- Seção `loaded_blocks_public_official` com inventário de 8 NRs e contagem de blocos
- Campo `norm_library_path`
- API-571, API-574 (ausentes no staging)
- ~60 triggers adicionais (mecanismos de dano, métodos END, vocabulário API/ASME expandido)

---

## 3. Comparação — Diferenças Relevantes

| Campo | Root (2026-05-11) | Staging (2026-05-10) | Relevância |
|---|---|---|---|
| `version` | 2026-05-11 | 2026-05-10 | Root é mais recente |
| NRs em `public_official` | 12 (inclui NR-14, 15, 22, 34) | 8 (ausentes NR-14, 15, 22, 34) | Root é mais completo |
| `loaded_blocks_public_official` | **Presente** — 8 NRs com contagem | **Ausente** | Root tem inventário de blocos |
| `norm_library_path` | **Presente** | **Ausente** | Root referencia biblioteca |
| `private_authorized` | 11 entradas (incl. API-571, 574) | 9 entradas | Root é mais completo |
| Triggers | ~80+ entradas | ~30 entradas | Root expandido com dano/END |
| Tamanho | 4.6 KB | 2.6 KB | Root ~77% maior |

**Relação entre os dois arquivos:** evolução linear. Staging = pré-instalação. Root = pós-instalação + atualização aplicada no dia seguinte. Não há conflito — há uma versão antiga e uma nova.

---

## 4. Decisão

**CASO A — Canônico evidente.**

```
CANÔNICO: .claude/skills/inspecao-end/norm_profile.yaml (versão 2026-05-11)
```

**Justificativa:**
1. É o arquivo mais recente (2026-05-11 vs. 2026-05-10);
2. É o arquivo mais completo — inclui blocos NR-14/15/22/34, `loaded_blocks_public_official` com inventário de blocos, triggers expandidos, APIs adicionais;
3. Está no caminho canônico da skill (`inspecao-end/`) — não em staging;
4. O arquivo staging está em `_staging/norm_patch_extract/` — diretório de pacotes de instalação, não de produção;
5. O README do staging confirma explicitamente que o pacote deve ser *instalado* no projeto, não usado diretamente de `_staging/`;
6. Não há evidência de que o staging seja uma versão mais atual divergente — é o arquivo pré-aplicação.

---

## 5. O que Não Foi Confirmado

| Item | Status |
|---|---|
| Vigência online das NRs listadas | `nao_verificada_online` — nenhuma norma foi checada em fonte primária |
| Existência física dos blocos JSONL referenciados | Os caminhos estão declarados; blocos não foram validados individualmente |
| Blocos API/ASME privados listados em `private_authorized` | Declarados como `private_authorized` — blocos físicos não confirmados em `_staging/` |
| Se o patch foi instalado integralmente | O `norm_profile.yaml` foi atualizado; outros componentes do patch não foram auditados aqui |

---

## 6. Regra de Uso pelo inspection-agent

```
O inspection-agent deve referenciar exclusivamente:
  .claude/skills/inspecao-end/norm_profile.yaml (versão 2026-05-11)

Regras de uso obrigatórias:
  1. Toda referência normativa tem confidence:referencial — vigência não confirmada online;
  2. NRs listadas em public_official são candidatas — aplicabilidade depende do equipamento, da jurisdição e do escopo contratual;
  3. APIs/ASME listadas em private_authorized dependem de acesso autorizado à norma — o agente não reproduz conteúdo privado;
  4. loaded_blocks_public_official = inventário declarado — não implica que o conteúdo foi verificado ou está atualizado;
  5. norm_profile canônico ≠ autorização de uso da norma ≠ conformidade com a norma ≠ laudo assinado.
```

---

## 7. Riscos

| Risco | Probabilidade | Mitigação |
|---|---|---|
| NRs listadas com vigência desatualizada | Presente | `confidence:referencial` obrigatório; verificar antes de uso formal |
| Blocos JSONL declarados mas não existentes fisicamente | Baixa (não verificado) | Verificar paths antes de Iteração 7.2 se QA usar blocos |
| Staging confundido com canônico em sessão futura | Baixa | Este documento é o registro de decisão |
| Patch normativo não integralmente instalado | Não verificado | Auditoria de instalação do patch não é escopo desta iteração |

---

## 8. Recomendação para o Arquivo Staging

**NÃO APAGAR** `_staging/norm_patch_extract/.claude/skills/inspecao-end/norm_profile.yaml`.

Razão: o diretório `_staging/norm_patch_extract/` é um artefato histórico de pacote de instalação. Manter permite rastreabilidade da evolução normativa. Não interfere com o canônico em produção.

---

## 9. Impacto no QA Futuro (Iteração 7.2)

| Aspecto | Implicação |
|---|---|
| Base normativa conhecida | QA pode testar cenários com NR-13 (163 blocos), NR-22 (530), NR-34 (409) |
| confidence:referencial | Todo QA de norma deve verificar se agente declara confidence corretamente |
| APIs privadas | QA não deve esperar conteúdo API/ASME sem dado explícito fornecido no input |
| Lacuna obrigatória | QA deve confirmar que agente declara LACUNA quando norma não tem dado de campo |

---

*Criado em Iteração 7.1b — 2026-06-10*
*Agente: inspection-agent — status: draft — active: false*
*Operador: operador-primario*
