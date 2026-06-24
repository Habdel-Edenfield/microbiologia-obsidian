# Regras operacionais do vault

Antes de criar ou alterar notas, Canvas, propriedades ou relações, leia
[[_Padrões do vault]].

Regras obrigatórias:

1. O Markdown é a fonte canônica; o Canvas é uma projeção visual.
2. Notas `aula` ou `conceito` com `status: completa` devem possuir um Canvas
   pareado, no mesmo diretório e com o mesmo nome-base.
3. Toda relação entre arquivos exibida no Canvas deve existir como `[[wikilink]]`
   em pelo menos uma das notas envolvidas. Arestas do Canvas não alimentam o
   Graph do Obsidian.
4. Títulos e rótulos devem nomear estruturas, processos, mecanismos, evidências
   ou limites metodológicos. Não usar metáforas, slogans ou perguntas como
   títulos científicos.
5. Coordenadas de Canvas devem seguir os tokens e fórmulas documentados em
   `[[_Padrões do vault#Geometria do Canvas]]`.
6. Não duplicar a nota focal com um card textual de resumo.
7. Após alterações estruturais, executar:

```bash
bash Scripts/validar-vault.sh
```

