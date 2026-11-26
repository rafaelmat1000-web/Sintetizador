# Sintetizador em FPGA (SystemVerilog)

Projeto desenvolvido para a disciplina de **Circuitos Lógicos II** (Engenharia da Computação - UFPB), implementando um sintetizador musical digital em **SystemVerilog** na placa **Altera DE2 (Cyclone II)** com saída de áudio em um **buzzer passivo**.

---

## Demonstração

https://github.com/user-attachments/assets/cb91f1d3-cd27-42bb-a276-54f9f34b9573

---

## Arquitetura e Módulos

O sistema segue uma arquitetura modular que separa a **lógica combinacional** (seleção da nota) da **lógica sequencial síncrona** (geração da onda sonora):

| Arquivo | Papel |
| :--- | :--- |
| `sintetizador.sv` | Top-level que conecta os módulos |
| `seletor_frequencia.sv` | Seleciona o valor de `N` conforme os botões e acende os LEDs |
| `onda_quadrada.sv` | Divide o clock de 50 MHz e gera a onda quadrada |
| `onda_triangular.sv` | Gerador de onda triangular |

### RTL Viewer (Quartus II)

<img width="1423" height="533" alt="RTL_Viewer" src="https://github.com/user-attachments/assets/448eb1dd-bf7e-4f00-999f-0c02dd28717f" />
---

## Princípio de Funcionamento

O módulo `onda_quadrada` utiliza o clock interno de **50 MHz** da placa DE2 e um contador de 20 bits (`contador_N`) para gerar a frequência de cada nota musical. A cada `N` ciclos de clock, o registrador `audio_saida` inverte seu estado lógico (`0` <-> `1`), resultando em um período completo de `2N` ciclos:

> **f_nota = 50.000.000 / (2 × N)**  &nbsp;→&nbsp;  **N = 50.000.000 / (2 × f_nota)**

Quando nenhuma tecla está pressionada (`N == 0`), o contador é zerado e a saída de áudio é mantida em nível baixo (silêncio).

---

## Hardware Utilizado

- **Placa FPGA:** Altera DE2 (Cyclone II)
- **Clock:** Oscilador interno de 50 MHz
- **Entradas:** 4 botões push-button (`notas[3:0]`) e 2 chaves deslizantes (`trocar_notas` e `seletor_onda`) 
- **Saídas:** 4 LEDs vermelhos (`ledr[3:0]`) e 1 pino GPIO conectado a um **buzzer passivo** (`audio_saida`)

---

## Como Compilar e Gravar na Placa

1. Clone este repositório:
   ```bash
   git clone https://github.com/rafaelmat1000-web/Sintetizador.git
   ```
2. Abra o arquivo `sintetizador.qpf` no **Intel/Altera Quartus II**.
3. Compile o projeto (**Processing > Start Compilation**) e grave o arquivo `.sof` gerado na placa DE2 pelo **Programmer** (as atribuições de pinos já estão configuradas no arquivo `sintetizador.qsf`).

---

## Equipe

- **Arthur Alves Xavier Gaia**
- **Rafael Matias Andrade De Morais**
- **Guilherme Xavier de Queiroz**

**Disciplina:** Circuitos Lógicos II - UFPB  
**Docente:** Profa. Verônica Lima
