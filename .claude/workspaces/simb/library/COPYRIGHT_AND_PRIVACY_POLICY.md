# COPYRIGHT_AND_PRIVACY_POLICY
## Política de Copyright e Privacidade — Biblioteca SIMB

**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Declaração geral

A biblioteca simbólica do SIMB-CORE respeita direitos autorais de terceiros e protege conteúdo privado do operador. Estas obrigações não são negociáveis.

---

## Localização de arquivos brutos

### `raw_private/`
- Contém: PDFs, epubs, arquivos brutos de livros e fontes
- Gitignored: **todo conteúdo é ignorado pelo Git**
- Regra do `.gitignore`:
  ```gitignore
  *
  !.gitignore
  ```
- Nunca adicionar arquivos deste diretório ao staging
- Nunca incluir caminhos de arquivos deste diretório em outputs versionados

### `extracted_private/`
- Contém: OCR, transcrições longas, extrações brutas de texto
- Gitignored: **todo conteúdo é ignorado pelo Git**
- Regra do `.gitignore`:
  ```gitignore
  *
  !.gitignore
  ```
- Nunca referenciar conteúdo deste diretório diretamente em cards versionados

---

## O que pode ir para Git

| Tipo de arquivo | Permitido no Git | Condições |
|---|---|---|
| Manifestos de fonte | Sim | Apenas metadados; sem texto da obra |
| Concept cards | Sim | Em palavras próprias; trechos: máx. 2-3 frases marcadas |
| Symbol cards | Sim | Em palavras próprias; sem reprodução de tradição extensa |
| Author maps | Sim | Descrições; sem reprodução de textos do autor |
| Reading notes | Sim | Resumos curtos em palavras próprias |
| LIBRARY_INDEX.md | Sim | Referências bibliográficas; sem texto |
| INTAKE_LOG.md | Sim | Metadados de intake; sem conteúdo da fonte |
| PDFs brutos | **Não** | Ficam em raw_private/ |
| OCR / extração longa | **Não** | Ficam em extracted_private/ |
| Diário do operador | **Não** | Nunca versionado |
| Sonhos do operador | Depende | Só se o operador autorizar explicitamente |
| Notas pessoais sensíveis | **Não** | Ficam em quarantine/ ou não entram |

---

## Trechos literais — regra de uso

Quando absolutamente necessário para ancorar uma leitura:

1. Máximo de **2-3 frases por card**
2. Formato obrigatório:
   ```
   > "[trecho literal]" (AUTOR, Título da Obra, Ano, p. XX)
   ```
3. Nunca trechos de página inteira ou parágrafo longo
4. Nunca sem indicação da fonte e página
5. Paráfrases sempre preferidas a citações literais

---

## Conteúdo privado do operador

### Categorias de conteúdo privado
- **Diário pessoal** — nunca versionado, nunca resumido sem autorização
- **Registros de sonho** — versionado apenas se o operador autorizar; sem interpretação automática de conteúdo íntimo
- **Notas pessoais** — classificar como `personal_note`; verificar antes de versionar
- **Dados financeiros pessoais** — fora do escopo desta biblioteca; domínio de asset-agent
- **Dados jurídicos pessoais** — fora do escopo desta biblioteca; domínio de legal-agent

### Regra geral para conteúdo do operador
O operador decide o que entra e o que fica privado. O agente não presume autorização.

---

## Responsabilidades

| Ação | Responsável |
|---|---|
| Decidir o que versionar | Operador primário |
| Aplicar gitignore corretamente | Claude Code (verificar em cada commit) |
| Não copiar texto integral | SIMB-AGENT + Claude Code |
| Manter raw_private/ e extracted_private/ fora do staging | Claude Code |
| Classificar risk_flags de copyright/privacy | SIMB-AGENT no intake |

---

## Invariantes

```
RAW BOOK ≠ GIT CONTENT
EXTRACTED TEXT ≠ GIT CONTENT
OPERATOR PRIVATE ≠ PUBLIC RECORD
EXCERPT ≠ FULL TEXT
COPYRIGHT ≠ BLOQUEIO TOTAL — apenas limita reprodução; referência é permitida
OPERATOR DECIDES WHAT IS VERSIONED
```
