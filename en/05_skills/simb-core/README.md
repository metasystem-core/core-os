# SIMB-CORE para Claude Code — V1.1

Pacote com duas variantes:

- `starter/`: versão "virgem" para quem nunca usou Claude Code Skills e quer instalar um operador simbólico-operacional do zero.
- `operator/`: versão já calibrada para o perfil operativo do usuário deste projeto.

## O que este pacote faz

Este pacote configura um operador para Claude Code que:

- lê material simbólico, relacional, conceitual e existencial;
- lê material bruto e denso, incluindo PDFs de livros, textos antigos, notas, diários, arquivos longos e corpus heterogêneos;
- distingue dado, inferência, hipótese, tradução ao usuário e transferência interpretativa;
- devolve leitura absorvível, precisa, viva e operacional;
- preserva prudência interpretativa;
- evita esterilidade, psicologismo barato, romantização e moralismo automático;
- mantém o usuário como último filtro;
- explicita limitações quando não há síntese forte o bastante.

## Princípio crítico

A skill opera em dois modos:

1. **USER-ALIGNED**
   - usa o perfil do usuário como prior de tradução;
   - serve para devolver análises metabolizáveis e utilizáveis;
   - ideal para relatos pessoais, conflitos, sonhos, impulsos e material já situado no ecossistema do usuário.

2. **SOURCE-FIRST**
   - prioriza o texto-fonte, o autor, a tradição, o corpus e a estrutura interna do material;
   - reduz a interferência do perfil do usuário na síntese inicial;
   - ideal para PDFs de livros, textos raros, tradições simbólicas, filosofia, budismo, corpus religiosos e materiais de compreensão difícil.

## Regras novas da V1.1

- em material filosófico, religioso, tradicional, histórico ou tecnicamente disputado, a adaptação ao usuário é proibida na camada 1 da resposta;
- se o texto exigir exegese real, a resposta deve conter seção de fidelidade à fonte antes de qualquer tradução pessoal;
- quando a resposta usar o campo do usuário como ponte, isso deve ser explicitado;
- o arcabouço simbólico usado deve ser nomeado e justificado;
- sob baixa base ou contradição real, a skill deve preferir mapa de tensões a síntese forçada.

## Estrutura do pacote

- `docs/PROJECT-DESIGN.md` — desenho completo do projeto, rationale, pipelines, modos de leitura e operadores.
- `starter/.claude/skills/simb-core/` — skill genérica inicial.
- `starter/.claude/agents/` — subagentes auxiliares.
- `starter/.claude/templates/` — templates de perfil, intake e sessão.
- `rafael/.claude/skills/simb-core/` — skill já calibrada.
- `rafael/.claude/agents/` — subagentes já orientados ao ecossistema do usuário.
- `rafael/.claude/templates/` — templates já preenchidos ou semi-preenchidos.

## Observação importante

Este pacote não é um substituto do discernimento do usuário.
Ele é um **braço simbólico-operacional**, não uma sentença ontológica.
O perfil do usuário deve funcionar como **prior de tradução**, nunca como prisão interpretativa.
