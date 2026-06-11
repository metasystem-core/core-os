# Checklist de auditoria do CORE-OS

## 1. Estrutura

- [ ] Pastas principais fazem sentido?
- [ ] Há arquivos soltos sem função?
- [ ] Há all-in-one dentro de pastas operacionais?
- [ ] Há backups misturados com runtime?
- [ ] Há duplicação de pastas?
- [ ] Há manifest atualizado?
- [ ] Há README suficiente?
- [ ] Há arquivos temporários versionados indevidamente?

## 2. Skills

- [ ] Toda skill tem função clara?
- [ ] Toda skill tem gatilho claro?
- [ ] Toda skill diz o que não faz?
- [ ] Há skill órfã?
- [ ] Há skill redundante?
- [ ] Há skill conceitual que deveria virar código?
- [ ] Há skill que deveria virar template?
- [ ] Há skill antiga que deveria ser arquivada?
- [ ] Há skill sem local-watchdog quando deveria ter?

## 3. Coerência constitucional

- [ ] Dados, hipótese, modelo e conclusão estão separados?
- [ ] SOURCE-FIRST está preservado onde necessário?
- [ ] Usuário vs operador está preservado?
- [ ] O sistema evita servir impulso?
- [ ] O sistema evita rigidez excessiva?
- [ ] FW-Kant aparece quando dignidade/autonomia importam?
- [ ] Regimes são respeitados no ASSET-CORE?
- [ ] Lacunas são declaradas?

## 4. Runtime

- [ ] O que está em Markdown deveria virar código?
- [ ] Há CLI?
- [ ] Há testes?
- [ ] Há sample_data?
- [ ] Há MockProvider?
- [ ] Há logs?
- [ ] Há schemas?
- [ ] Há memória por hash?
- [ ] Há packetização canônica?
- [ ] Há risco de depender demais de IA para mecânica?

## 5. Custo

- [ ] Há uso de Claude para tarefa mecânica?
- [ ] Há prompts abertos demais?
- [ ] Há tarefa que poderia rodar offline?
- [ ] Há reprocessamento?
- [ ] Há cache?
- [ ] Há delta analysis?
- [ ] Há relatório em arquivo em vez de chat longo?

## 6. Privacidade

- [ ] Há dados pessoais em pasta pública?
- [ ] Há processo jurídico real?
- [ ] Há carteira real?
- [ ] Há credenciais?
- [ ] Há tokens?
- [ ] Há raw emails?
- [ ] Há estratégia jurídica pessoal?
- [ ] Há separação public/private?

## 7. Memória

- [ ] Memórias têm fonte?
- [ ] Têm data?
- [ ] Têm validade?
- [ ] Têm status?
- [ ] Têm hash?
- [ ] Têm trigger de atualização?
- [ ] Há risco de memória velha virar verdade?

## 8. Produto/usabilidade

- [ ] Usuário comum conseguiria usar?
- [ ] Há modo campo?
- [ ] Há fricção demais?
- [ ] O sistema pergunta demais?
- [ ] Há resposta comprimida?
- [ ] Há templates operacionais?
- [ ] Há fluxo claro de "jogar arquivo e catalogar"?

## 9. Integração

- [ ] Novos módulos conversam com FW-CORE?
- [ ] Conversam com HARVEST?
- [ ] Conversam com VERSIONING?
- [ ] Conversam com QA?
- [ ] Há conflitos entre versões?
- [ ] Há docs desatualizados?

## 10. Resultado

- [ ] Achados classificados?
- [ ] Prioridades definidas?
- [ ] Custo estimado?
- [ ] Risco estimado?
- [ ] Próxima ação mínima?
- [ ] O que NÃO mexer foi declarado?
