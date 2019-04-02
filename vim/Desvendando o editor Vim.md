**Vim** é um editor de texto poderoso e altamente configurável. Contudo, ele possui uma curva de aprendizado estranha – às vezes parece mais uma escada de degraus desiguais do que uma curva. O primeiro contato com ele é quase sempre de estranhamento.

Tudo isso é motivo suficiente para afastar os menos pacientes ou curiosos, mas não desista sem ao menos tentar junto a esse guia!

Há várias razões para o vim ter se tornado um editor famoso: Além de possuir uma [comunidade forte](http://vim.wikia.com/wiki/Vim_Tips_Wiki) – e cheia de truques nas mangas – há uma diferença notável na produtividade ao editar arquivos, principalmente para programadores. E não se engane, este não é só um editor com “alguns truques a mais”.

Este tutorial vem com um [arquivo](https://github.com/victorsprengel/vimtutorialcaelum/blob/master/vimtutorial.txt) junto. Caso queira acompanhar e testar as dicas enquanto aprende, recomendo que faça o download do arquivo.

## Atalhos e comandos

Vamos começar abrindo o editor:

Primeiro abra o **terminal** (OSX/Linux) ou o **prompt**(Windows). O simples comando **vim** abre o editor vazio (será necessário especificar onde salvar posteriormente). Alternativamente, **vim vimtutorial.txt** abre o arquivo de nome “vimtutorial.txt”.

É bem provável que a primeira impressão seja: “não consigo digitar!”. Bem, o vim possui alguns **modos**, e o que você pode fazer muda em cada um deles. Não se preocupe, logo você entenderá como eles funcionam.

Antes disso, vamos aprender como funcionam **atalhos** no vim. Uma das sacadas dos criadores foi tentar reduzir ao máximo o uso de modificadores como **CTRL** ou **SHIFT** (que de fato causam uma baita tendinite). Eles conseguiram isso com a distinção de modos, fazendo com que a maioria das teclas sejam um atalho.

De agora em diante, passe a testar os atalhos conforme forem apresentados, isso lhe dará familiaridade e conforto com o editor.

Antes de começar, tenha uma coisa em mente: muitos comandos do vim podem ser repetidos múltiplas vezes se digitarmos um número antes dele. Por exemplo: digite “**10dd**” e seu editor apagará as **próximas dez linhas**. Use isso a seu favor!

Para os que estão seguindo o arquivo-tutorial, tem um exemplo de uso desse comando no arquivo.

**CUIDADO** – há distinção entre letras maiúsculas e minúsculas no vim. Isto é, o comando **r** pode ser diferente do **R**. A tecla **CAPSLOCK** inverte o comportamento.

Preparado para começar com o vim? Então bora conhecer os seus modos.

### Modo ‘normal’

Este é o modo no qual o vim inicia. Você identifica-o quando não há nenhuma informação no canto inferior esquerdo da tela:

Essa é a tela inicial quando não especificamos nenhum arquivo ao abrir o editor. Note que ele inicia no _normal mode_.

Ele serve para **navegação** e **manipulação de texto**. Nele você pode utilizar as setas, home e end para se mover. Segue o exemplo de alguns comandos muito utilizados:

*   **dd**: remove a linha atual (_delete_)
*   **dt**: remove tudo da linha que está entre seu cursor e a primeira ocorrência do caractere digitado logo em seguida. (_delete ‘till_)
*   **x**: recorta o caractere atual para colar depois (_cross_)
*   **yy**: copia a linha atual (_yank_)
*   **p**: cola o que está colado, o clássico _paste_
*   **w**: andar o cursor uma palavra (_word_)
*   **b**: volta o cursor uma palavra (_back_)
*   **u**: equivalente ao **CTRL+z**, ou seja, _undo_
*   **CTRL+R**: é o _redo_, ou seja, desfaz o _undo_

Note que, no geral, os comandos vem do nome das ações, o que ajuda muito a memorizar tudo.

Outra sacada dos criadores foi dar um jeito de manter a mão do programador sempre pelas letras. Assim, **h**, **j**, **k** e **l** podem ser usados como setas **neste modo** (esquerda, baixo, cima, direita).

Nesse modo você também pode digitar **/** (_forward-slash_) e digitar uma **palavra** ou até uma [expressão regular](https://pt.wikipedia.org/wiki/Express%C3%A3o_regular). Essa é a **busca**.

Ao apertar **enter**, você poderá navegar pelos resultados com **SHIFT+n** e **n** (resultado anterior/próximo resultado). Use **ESC** para sair dela.

Caso esteja acompanhando com o arquivo-tutorial, experimente digitar “**/palavras**” e ver a busca em ação.

Note que a busca, por padrão, **não destaca** todas as palavras, mas apenas move o cursor. É claro que podemos mudar isso – um exemplo do quão **configurável** o vim é.

### Modo ‘insert’

Esse modo é o mais procurado por iniciantes – o modo de **escrita**! Para acioná-lo basta apenas mover o cursor para o local desejado e então digitar a tecla **i**. Agora já podemos escrever! Veja:

Note que no canto inferior esquerdo aparece o **INSERT**, portanto, com este visual, pode editar seu arquivo à vontade.

Além do **i**, há outras alternativas de entrar neste modo. A diferença é o que acontece com o cursor **um momento antes** de você poder digitar:

*   **A**: move o cursor para o final da linha
*   **I**: move o cursor para o começo da linha
*   **o**: abre uma linha vazia abaixo da atual e move o cursor para ela
*   **O**: abre uma linha vazia acima da atual e move o cursor para ela

Legal, estamos digitando, mas como podemos, por exemplo, **sair desse modo** e voltar para o normal? Simples, basta apenas usar a tecla **ESC**! E é basicamente isso. Aproveite o momento para fazer o exercício descrito no arquivo.

### Modo ‘visual’

Esse modo serve para **selecionar** e **manipular texto**. Nele podemos usar quase todos os comandos do modo normal, mas eles serão **aplicados em toda a seleção**.

Esse é o _visual mode_. Nós temos uma indicação no canto esquerdo inferior e o texto selecionado é **destacado**.

Um **aviso**: é necessário passar pelo modo normal sempre que você for **trocar de modos**. Por exemplo, se você está em insert e gostaria de ir para visual, é necessário usar **ESC** primeiro e partir daí. Isso vale para qualquer troca entre modos que não envolva o normal.

Inclusive, é considerado **boa prática** (e também mais conveniente) manter-se no modo normal se não estiver fazendo nada (idle).

Dito isso, veja os comandos para entrar no modo visual, e o tipo de seleção que eles proporcionam:

*   **v**: seleção caractere a caractere
*   **V**: seleção de linhas
*   **CTRL+V**: seleção de bloco

Você pode, por exemplo, selecionar várias linhas, copiar com **y** e colar em outro lugar com **p**.

Uma outra utilização do modo visual é o **dobrar** (_folding_) várias linhas em uma só. Por exemplo, para **esconder as linhas** de uma função que você não vai modificar no futuro próximo.

Para fazer isso selecione as linhas que você quer juntar temporariamente (é apenas um efeito visual) com **V** e digite **zf**. Depois, para **desdobrar** as linhas comprimidas, navegue o cursor até ela e pressione **zo**. Para treinar, siga o tutorial no arquivo.

Veja como o vim indica que ele **comprimiu** visualmente 12 linhas para uma só:

### Modo ‘command-line’

Até agora conseguimos editar, navegar e selecionar texto no nosso arquivo. Mas não temos nenhuma pista de como **salvar** o arquivo ou **fechar** nosso editor.

Claro, podemos fechar o terminal, mas isso – além de inconveniente – não resolve o problema de salvar. Mas então, qual o atalho para cada uma dessas funções? Mais do que um atalho, certas ações precisam usar **comandos**. O modo que permite isso é o **command-line**:

Ao pressionar ‘**:**’ seu cursor existirá apenas no canto inferior esquerdo, onde você pode digitar e executar comandos com **ENTER**. O histórico pode ser navegado com as setas para cima e para baixo. Segue alguns comandos importantes:

*   **w**: salva o arquivo, pode opcionalmente colocar um nome em seguida para salvar no arquivo com este nome
*   **q**: sai do vim e volta para o terminal. Você pode usar q! para sair sem salvar
*   **%s/padrão/substituto/opções**: substituição
*   **vs**: abre na mesma tela o arquivo especificado, dividindo o espaço verticalmente
*   **split**: abre na mesma tela o arquivo especificado, dividindo o espaço horizontalmente

O comando de substituição merece mais atenção. Vamos começar com um exemplo: **%s/antigaVariavel/novaVariavel/g**. Ao executar esse comando, toda ocorrência de _antigaVariavel_ será trocada por _novaVariavel_. Veja antes:

e depois:

O **g** no final indica **global**, ou seja, no arquivo todo. Você pode adcionar **c** (**/gc**) para que o editor pergunte, a cada ocorrência, se você deseja fazer a substituição:

Como na busca, tanto **padrão** quanto **substituto** podem ser **expressões regulares**, o que dá **muito poder** para o editor! Para treinar, existe um exercício no arquivo disponibilizado.

Uma funcionalidade interessante é que os **splits** podem ser feitos **recursivamente**, ou seja, o espaço da tela designado para um espaço pode ser dividido com outro arquivo. Vamos ver um exemplo (extremo) dessa característica:

Veja como os splits funcionam! Fica claro porque eu não recomendo que passe de 4 telas. Mas mesmo assim ainda não sabemos como lidar com tantas telas. Alguns atalhos nos ajudam com isso:

Para navegar entre cada tela (como um **CTRL+TAB** no browser), **CTRL+w** pode ser usado ao ser pressionado duas vezes seguidas. Alternativamente, você pode ir para uma **direção** com **CTRL+w+h/j/k/l** (esquerda, baixo, cima, direita). Por fim, para **fechar** um split, basta fechar o arquivo com **:q**.

## Conclusão

Embora você já consiga abrir o seu (possívelmente) novo editor preferido e usá-lo, ainda existem muitos truques e configurações que dão mais poder ao usuário.

Do jeito que está ele é feio, não tem informações importantes à vista e ainda apresenta comportamentos estranhos. Ainda bem que, como você já deve ter adivinhado, tudo isso pode ser **customizado** de modo a **atender suas necessidades** e gostos.

O próximo passo é aprender a preencher o seu arquivo de configurações, o **.vimrc**. Há muitas configurações possíveis, e apenas com elas podemos tirar o máximo de todas _features_ que você acabou de aprender. O ideal é pegar um [.vimrc base](http://vim.wikia.com/wiki/Example_vimrc) e ir adicionando o necessário.

Por sua sorte, a comunidade do vim é bem forte e leal – e material para aprender é o que não falta. Além disso, aproveite e deixe o seu comentário sobre o que achou do vim.

Aprender uma ferramenta e suas features é sempre bacana, pois o nosso trabalho se torna cada vez mais produtivo, certo? Então que tal aprender alguns truques com o Eclipse IDE também?

Na Alura, temos o [curso online de produtividade com o Eclipse IDE](https://www.alura.com.br/curso-online-eclipse) no qual aborda muitas das técnicas e dicas visando a produtividade com uma das ferramentas mais famosas entre os desenvolvedores Java. Na Caelum ele também é usado durante os cursos, assim como o Android Studio no curso de Android!
