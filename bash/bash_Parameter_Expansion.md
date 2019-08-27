## bash Parameter Expansion

<http://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion>

#### Extract File Name from Full File Path

Use greedy pattern deletion `${parameter##pattern}`

```bash
${i##*/}
```
#### Replace Pattern

Use pattern substitution `${parameter/pattern/replacement}`

```bash
${i/.bam/.bed}
```
#### Combine Pattern Deletion and Pattern Replacement to Extract and Modify a File Name

```bash
$i
j=${i##*/}
${j/.bam/.bed}
```
