# Perguntas e respostas sobre o SWAP

<br></br>

 

[![Disco rígido](https://i0.wp.com/elias.praciano.com/wp-content/uploads/2016/03/hard-disc-clipart.png?resize=512%2C662&ssl=1)

## O que é o swap

Área de troca ou swap é um espaço em disco que, em conjunto com a memória física (RAM), faz parte do sistema de memória virtual.  
A área de troca guarda temporariamente as páginas de memória inativas.  
Este espaço é usado quando o sistema percebe que precisa de mais memória física (além da que se encontra disponível) para os processos ativos e para os dados que estão em uso.  
O swap pode ficar em uma partição dedicada do disco rígido (o que é recomendado), em um arquivo de swap ou em uma combinação dos dois.  
Seu principal defeito é que seu tempo de acesso é muito lento.  
Se comparar a velocidade da memória RAM com as taxas de transferência dos discos rígidos mais rápidos, o swap é extremamente lento, para ser usado como memória.  
Trata-se de um paliativo e não, exatamente, uma solução.  
Se o seu sistema está fazendo uso intenso do swap, você deveria pensar em adquirir mais memória RAM.  
[![Disco rígido, HDD](https://i0.wp.com/elias.praciano.com/wp-content/uploads/2016/03/hard-drive-65.jpg?resize=512%2C341&ssl=1)


## Por que necessitamos de SWAP

Há várias situações em que o seu sistema pode recorrer ao uso do swap.

*   Programas consomem memória.  
    Alguns programas consomem muita memória — o que pode fazer com que o sistema necessite, temporariamente, de uma quantidade extra de espaço na memória RAM.  
    Parte dos recursos, das informações ou páginas usadas por programas podem não estar mais sendo utilizadas. Neste caso, o sistema pode movê-las para a área de troca, liberando memória RAM para as tarefas ativas.
*   O [recurso de hibernação](https://elias.praciano.com/2014/09/suspender-ou-hibernar/) ou _suspend-to-disk_ funciona gravando o conteúdo da memória RAM na partição, antes de desligar a máquina.  
    Para isto ocorrer, é necessário que o espaço alocado para o swap seja do tamanho (pelo menos) da sua memória RAM.
*   Circunstâncias ou eventos imprevisíveis, de vários tipos (o que inclui programas com “mau comportamento”) podem ocupar uma grande quantidade de memória. Neste caso, é bom ter um espaço extra para “manobrar” dentro do sistema.
*   Otimizar o uso da memória do sistema, uma vez que os discos rígidos são consideravelmente mais lentos do que a RAM. Isto ocorre por que o acesso aos dados envolve a movimentação de partes mecânicas, no caso dos HDs.  
    Ainda que você considere o uso do swap em uma [unidade de estado sólido](https://elias.praciano.com/?s=ssd) (ou SSD – _Solid State Drive_), ela ainda será significativamente mais lenta que a memória RAM.  
    Deixar o gerenciamento de memória do sistema para o Linux resolver, costuma ser a melhor política.  
    O Linux carrega os arquivos para a RAM e os mantém lá para uso posterior. Os arquivos armazenados na RAM podem ser disponibilizados instantaneamente.  
    Há porções da RAM separados para para acelerar a leitura dos dispositivos de armazenamento auxiliares (leitores de CD/DVD/Bluray, cartões de memória, USB etc) — e são chamadas de _cache_.  
    A função do sistema de cache, é armazenar em RAM, dados que estão sendo lidos dos dispositivos auxiliares, para que possam ser acessados mais rapidamente.  
    Uma vez que o _caching_ é uma das melhores formas de agilizar as tarefas, o Linux prefere mover dados pouco usados para o swap, em função de liberar mais memória para [o sistema de cache](https://elias.praciano.com/2013/07/como-limpar-a-memoria-cache-no-linux/) — que é uma solução mais eficiente.

> O sistema de gestão da memória, no Linux, é comprovadamente excelente. O aperfeiçoamento deste sistema, contudo, pode ser feito através de ajustes, que o adequem às necessidades específicas das aplicações que você estiver rodando.

*   Otimizar a performance do próprio swap. Já que este também usa o disco rígido ao mesmo tempo que todo o resto do sistema, pode causar gargalos e afetar seriamente a performance do sistema.  
    Uma das formas de evitar este problema é manter a área de troca em um drive físico diferente — para evitar a competição por recursos entre os aplicativos e o sistema de swap.

## Qual o tamanho ideal do swap

Em distribuições populares, como o Ubuntu, Debian, Fedora etc. instaladas em máquinas com menos de 1 GB de memória física (RAM), o tamanho do swap deve ser equivalente à quantidade de memória.  
Se você tiver muito espaço no disco rígido, pode configurar o sistema para usar mais swap, até um teto equivalente ao dobro da capacidade de memória física.  
A partir deste valor, não há benefícios significativos.  
Se você precisa de um swap maior do que o dobro da capacidade de memória RAM, você deveria investir em aumentar a quantidade de memória física do sistema.  
Geralmente, se algo demora 1 segundo para ser feito dentro da memória RAM, levaria 15 minutos para ser feito a partir do disco rígido. Mesmo em um SSD rápido, o trabalho ainda levaria mais de um minuto.  
É seguro acompanhar a tabela abaixo, para computadores com até 1 GB de memória RAM:

<table>

<tbody>

<tr>

<th>Quantidade de RAM</th>

<th>Sem hibernação</th>

<th>Com hibernação</th>

<th>Máximo</th>

</tr>

<tr>

<td span="4"><small>(Valores em MB)</small></td>

</tr>

<tr>

<td>256</td>

<td>256</td>

<td>512</td>

<td>512</td>

</tr>

<tr>

<td>512</td>

<td>512</td>

<td>1024</td>

<td>1024</td>

</tr>

<tr>

<td>1024</td>

<td>1024</td>

<td>2048</td>

<td>2048</td>

</tr>

</tbody>

</table>

Trocando em miúdos, configure o tamanho do swap para ser igual ao da memória física da sua máquina, **se não for usar o recurso de hibernação**. Se for usar o recurso, configure o swap para o dobro da memória física.  
Para computadores, com maior quantidade de memória, use os valores da tabela a seguir.

<table>

<tbody>

<tr>

<th>Quantidade de RAM</th>

<th>Sem hibernação</th>

<th>Com hibernação</th>

<th>Máximo</th>

</tr>

<tr>

<td span="4"><small>(Valores em GB)</small></td>

</tr>

<tr>

<td>1</td>

<td>1</td>

<td>2</td>

<td>2</td>

</tr>

<tr>

<td>2</td>

<td>1</td>

<td>3</td>

<td>4</td>

</tr>

<tr>

<td>3</td>

<td>2</td>

<td>5</td>

<td>6</td>

</tr>

<tr>

<td>4</td>

<td>2</td>

<td>6</td>

<td>8</td>

</tr>

<tr>

<td>5</td>

<td>2</td>

<td>7</td>

<td>10</td>

</tr>

<tr>

<td>6</td>

<td>2</td>

<td>8</td>

<td>12</td>

</tr>

<tr>

<td>8</td>

<td>3</td>

<td>11</td>

<td>16</td>

</tr>

<tr>

<td>12</td>

<td>3</td>

<td>15</td>

<td>24</td>

</tr>

<tr>

<td>16</td>

<td>4</td>

<td>20</td>

<td>32</td>

</tr>

<tr>

<td>24</td>

<td>5</td>

<td>29</td>

<td>48</td>

</tr>

<tr>

<td>32</td>

<td>6</td>

<td>38</td>

<td>64</td>

</tr>

<tr>

<td>64</td>

<td>8</td>

<td>72</td>

<td>128</td>

</tr>

<tr>

<td>128</td>

<td>11</td>

<td>139</td>

<td>256</td>

</tr>

</tbody>

</table>

Estas tabelas demonstram o quanto é indesejável inflar a área de troca no Linux — use apenas o necessário.  
Geralmente, o recurso de hibernação não faz sentido em servidores. Portanto, podem usar a quantidade mínima de espaço na área de troca.

## O que é mais rápido? Usar uma partição exclusiva para swap ou usar um arquivo swap?

Na perspectiva do usuário final, em kernel de versão superior a 2.6.x, arquivos de swap e partições de swap têm o mesmo desempenho de velocidade.  
A limitação dos arquivos de swap é que precisam ter seus blocos todos contíguos para obter o melhor desempenho.  
A fragmentação não é um problema pro kernel — na verdade, o sistema de swap pode englobar partições, arquivos, drives USB etc. todos de uma vez.  
O kernel mantém um mapeamento com a localização de cada dispositivo e o acessa diretamente, ignorando o cache e o sistema de arquivos.  
Embora não seja um problema, esta situação concorre para a redução do desempenho.  
A documentação da Red Hat recomenda que você use partições exclusivas para swap, portanto.  
Quando a partição exclusiva para swap reside em disco rígido (HDD), que é um dispositivo magnético e rotativo, é possível tirar vantagem da localização contígua e desfragmentada dos dados — o que proporciona um tempo de busca menor.  
Contudo, é mais fácil administrar os arquivos de swap: você os pode colocar onde quiser; é fácil redimensionar etc.

## Podemos usar o swap em uma unidade SSD?

As pessoas costumam ver este cenário como problemático, por 2 motivos:

1.  por acreditar que o swap é muito usado no seu sistema, causando um grande fluxo de dados — intensa atividade de leitura e escrita e
2.  por acreditar que as unidades SSD não suportam um grande número de eventos de leitura e escrita

O fato é que, no Linux, o swap é muito pouco usado. Em um sistema com quantidade adequada de memória para as suas aplicações, há poucas possibilidades de se chegar a usar o swap.  
Ainda neste post, mostro como saber a quantidade de swap que você está usando no sistema.  
Ainda que fosse muito usado, como no Windows, ainda assim se recomenda deixar o swap no SSD.  
As unidades SSD atuais suportam uma grande quantidade de operações de leitura e escrita — o suficiente para você não precisar se preocupar com o suposto desgaste.  
Some a isto o fato de que as partições swap do Linux, por padrão, executam [operações de _trimming_](https://elias.praciano.com/2014/09/como-ativar-o-trim-no-linux-para-sua-unidade-ssd/), quando o dispositivo de bloco tem suporte ao TRIM.  
Portanto, a resposta é sim. Se você tem uma unidade SSD atual, com espaço para uma partição ou arquivo de swap, é recomendado usá-lo.

## O que é o swapiness?

O parâmetro de controle swapiness dita a tendência do kernel a mover processos da memória física para o swap (arquivo ou partição).  
Como já se sabe, discos são muito mais lentos do que a memória RAM.  
Portanto, quanto mais o sistema usa a área de troca em disco, mais lento ele se torna.  
O swapiness regula esta relação entre o uso da memória física e o swap:

*   pode ter um valor entre 0 e 100
*   ao definir o valor 0 para o swapiness, você diz pro kernel para só mover processos da memória física para a área de troca em último caso
*   ao definir o valor 100 par o swapiness, você diz ao kernel para mover agressivamente processos da memória física para o swap

Nas principais distribuições GNU/Linux, como Ubuntu, Debian, Fedora etc. o valor padrão do swapiness é igual a 60.  
No artigo [Como melhorar a performance do Ubuntu](https://elias.praciano.com/2014/05/como-melhorar-o-desempenho-do-ubuntu/), reduzir o valor do swapiness é apontado como uma das medidas a ser adotada para melhorar o desempenho geral do sistema.  
No site oficial (veja links ao final do texto) da comunidade e suporte ao Ubuntu, há uma recomendação para usar `swapiness=10` em instalações de uso normal.  
Para verificar o valor atual do swapiness no seu sistema, use o seguinte comando:

<pre class="brush: bash; gutter: false; title: ; notranslate" title="">cat /proc/sys/vm/swappiness</pre>

Se você quiser saber mais sobre este assunto e aprender a alterar o swapiness, leia o texto [Reduza o uso do swap e melhore o desempenho do Linux](https://elias.praciano.com/2014/05/reduza-o-uso-do-swap-e-melhore-o-desempenho-do-linux/).  
[![Memória RAM](https://i0.wp.com/elias.praciano.com/wp-content/uploads/2016/03/chips-20072_640.jpg?resize=602%2C309&ssl=1)


## Por que o Linux não está usando o swap?

É possível saber quanto do swap está sendo usado em seu sistema com o comando free:

<pre class="brush: bash; gutter: false; title: ; notranslate" title="">free -h</pre>

<pre class="brush: plain; gutter: false; highlight: [4]; title: ; notranslate" title="">             total       used       free     shared    buffers     cached
Mem:          7,5G       3,5G       4,0G       403M        90M       1,7G
-/+ buffers/cache:       1,7G       5,8G
Swap:          15G         0B        15G
</pre>

Neste momento, no meu sistema 0 bytes estão sendo usados pelo swap.  
A resposta mais simples para esta situação é: se o sistema não está usando, é por que não é necessário.  
Contudo, você pode alterar o quadro se abrir vários aplicativos vorazes por recursos da memória do sistema — como o Gimp, o LibreOffice, o [Audacity](https://elias.praciano.com/2014/05/crie-toques-mp3-com-audacity/) etc).  
Depois disto, rode o comando free mais uma vez.  
Incrementar o valor do swapiness, como já foi explicado antes, pode ser uma forma mais agressiva de aumentar o uso do swap.  
Lembre-se também que o Linux usa o recurso durante a hibernação — onde ele grava o estado atual da memória do sistema.  
Você pode também verificar se há e qual é a partição swap no seu sistema, com o comando fdisk:

<pre class="brush: bash; gutter: false; title: ; notranslate" title="">sudo fdisk -l | grep swap</pre>

<pre class="brush: plain; gutter: false; title: ; notranslate" title="">[sudo] password for justincase: 
/dev/sda1  *        2048  31999999  31997952  15,3G 82 Linux swap / Solaris
</pre>

## Como esvaziar o swap

Mesmo tendo uma grande quantidade de RAM e mesmo que você esteja usando um valor baixo para o swapiness, ainda é possível que o seu sistema recorra ao swap, em algum momento.  
Se isto acontecer, você pode manualmente esvaziar esta área.  
Só para ficar claro, este procedimento é totalmente desnecessário e você nunca deveria se preocupar em esvaziar a área de troca do seu sistema — o próprio Linux se encarrega de fazer isto automaticamente.  
Os próximos passos necessitam de privilégios administrativos para serem realizados:

1.  Inicie o seu editor favorito para criar o script `swap2ram.sh`. Eu vou guardar o meu script em ‘/usr/local/sbin/’. Você pode gravar o seu onde quiser. Apenas tome o cuidado para adequar as instruções deste post ao que você vai realizar aí.
2.  O conteúdo do script é o que segue:

    <pre class="brush: bash; gutter: false; title: ; notranslate" title="">#!/bin/sh

    mem=$(LC_ALL=C free  | awk '/Mem:/ {print $4}')
    swap=$(LC_ALL=C free | awk '/Swap:/ {print $3}')

    if [ $mem -lt $swap ]; then
        echo "ERRO: não há espaço suficiente em RAM para transferir o conteúdo do swap. Não é possível prosseguir." >&2
        exit 1
    fi

    swapoff -a && 
    swapon -a

    </pre>

3.  Após gravar o seu script, torne-o executável:

    <pre class="brush: bash; gutter: false; title: ; notranslate" title="">sudo chmod +x /usr/local/sbin/swap2ram.sh
    </pre>

Basicamente, o script `/usr/local/sbin/swap2ram.sh` compara a quantidade de memória RAM disponível e o tamanho do swap.  
Se houver espaço suficiente na primeira, o script prossegue com a desativação (swapoff) e ativação (swapon) da área de troca.

* * *

Imagens: [http://www.pixabay.com](http://www.pixabay.com).

#### Referências

[https://lkml.org/lkml/2006/5/29/3](https://lkml.org/lkml/2006/5/29/3).  
[https://en.wikipedia.org/wiki/Paging#Linux](https://en.wikipedia.org/wiki/Paging#Linux).  
[https://help.ubuntu.com/community/SwapFaq](https://help.ubuntu.com/community/SwapFaq).  
[https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html/Deployment_Guide/ch-swapspace.html](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html/Deployment_Guide/ch-swapspace.html).

<div class="sharedaddy sd-sharing-enabled">

<div class="robots-nocontent sd-block sd-social sd-social-icon-text sd-sharing">

