# Modelo de Segurança — CORE-OS

## Princípio

O operador é dono do sistema. A IA é intérprete. A plataforma é ambiente temporário.

**Regra de minimização:** A IA recebe o menor contexto suficiente para executar a tarefa com qualidade.

## Três Camadas

| Camada | Conteúdo | Compartilhável |
|---|---|---|
| **Pública operacional** | Arquitetura, operadores, templates, glossário, processos genéricos | ✓ Sim |
| **Privada sensível** | Dados jurídicos, valores financeiros, dados pessoais, nomes em conflito | ✗ Não |
| **Arquivo bruto restrito** | Exports de IA, histórico completo de conversas, dados não filtrados | ✗ Não |

## Regras Práticas

1. Nunca subir export bruto sem triagem.
2. Criar sínteses por núcleo — não histórico bruto.
3. Remover nomes quando não estritamente necessário.
4. Separar documento de interpretação.
5. Manter cópias versionadas locais.
6. Antes de enviar algo para uma IA, perguntar:
   - Isso precisa mesmo ir?
   - Pode ser sanitizado?
   - Qual é o menor contexto suficiente?
   - Qual dano se isso vazar?

## Guia de Sanitização

| Original | Sanitizado |
|---|---|
| Nome completo | Iniciais |
| Valor financeiro exato | Faixa (ex: "R$ 50k–100k") |
| Endereço completo | Região geral |
| Número de processo | Manter só se necessário para contexto |
| Nome de empresa em conflito | Categoria (ex: "ex-empregador") |
