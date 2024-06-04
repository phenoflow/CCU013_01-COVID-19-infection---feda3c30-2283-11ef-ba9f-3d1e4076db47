cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu013_01-covid-19-infection-confirmed---primary:
    run: ccu013_01-covid-19-infection-confirmed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  ccu013_01-covid-19-infection-reference---primary:
    run: ccu013_01-covid-19-infection-reference---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-confirmed---primary/output
  ccu013_01-covid-19-infection-result---primary:
    run: ccu013_01-covid-19-infection-result---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-reference---primary/output
  ccu013_01-covid-19-infection-antibody---primary:
    run: ccu013_01-covid-19-infection-antibody---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-result---primary/output
  acute-ccu013_01-covid-19-infection---primary:
    run: acute-ccu013_01-covid-19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-antibody---primary/output
  ccu013_01-covid-19-infection-speciman---primary:
    run: ccu013_01-covid-19-infection-speciman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: acute-ccu013_01-covid-19-infection---primary/output
  ccu013_01-covid-19-infection-assay---primary:
    run: ccu013_01-covid-19-infection-assay---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-speciman---primary/output
  ccu013_01-covid-19-infection-serum---primary:
    run: ccu013_01-covid-19-infection-serum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-assay---primary/output
  ccu013_01-covid-19-infection-detection---primary:
    run: ccu013_01-covid-19-infection-detection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-serum---primary/output
  ccu013_01-covid-19-infection-detected---primary:
    run: ccu013_01-covid-19-infection-detected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-detection---primary/output
  ccu013_01-covid-19-infection-scale---primary:
    run: ccu013_01-covid-19-infection-scale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-detected---primary/output
  ribonucleic-ccu013_01-covid-19-infection---primary:
    run: ribonucleic-ccu013_01-covid-19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-scale---primary/output
  ccu013_01-covid-19-infection-coronavirus---primary:
    run: ccu013_01-covid-19-infection-coronavirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ribonucleic-ccu013_01-covid-19-infection---primary/output
  ccu013_01-covid-19-infection-severity---primary:
    run: ccu013_01-covid-19-infection-severity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-coronavirus---primary/output
  ccu013_01-covid-19-infection-antigen---primary:
    run: ccu013_01-covid-19-infection-antigen---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-severity---primary/output
  covid19---primary:
    run: covid19---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-antigen---primary/output
  ccu013_01-covid19-infection---primary:
    run: ccu013_01-covid19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: covid19---primary/output
  ccu013_01-covid-19-infection-ventilation---primary:
    run: ccu013_01-covid-19-infection-ventilation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid19-infection---primary/output
  positive-ccu013_01-covid-19-infection---primary:
    run: positive-ccu013_01-covid-19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: ccu013_01-covid-19-infection-ventilation---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: positive-ccu013_01-covid-19-infection---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
