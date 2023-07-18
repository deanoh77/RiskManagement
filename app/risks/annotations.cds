using RiskService as service from '../../srv/risk-service';
// Risk List Report Page
annotate RiskService.Risks with @(UI : {
    HeaderInfo : {
        TypeName        : 'Risk',
        TypeNamePlural  : 'Risks',
        Title : {
            $Type   : 'UI.DataField',
            Value   : title
        },//Title 
        Description : {
            $Type   : 'UI.DataField',
            Value   :  descr
        } // Descrtiption
    },//HeaderInfo
    SelectionFields  : [prio], 
    Identification  : [{Value   : title}],
    //Define the table columns
    LineItem  : [
        {Value  : title},
        {Value  : miti_ID},
        {Value  : owner},
        {Value  : bp_BusinessPartner},
        {
            Value   : prio,
            Criticality: criticality
        },
        {
            Value   : impact,
            Criticality: criticality
        }
    ],//LineItem
}); //annotate RiskService.Risk - Report page  
// Risk Object Page
annotate RiskService.Risks with @(UI :{
    Facets  : [{
        $Type   : 'UI.ReferenceFacet',
        Label   : 'Main',
        Target  : '@UI.FieldGroup#Main',
    }],//Facets
    FieldGroup #Main : {Data: [
        {Value  : miti_ID},
        {Value  : owner},
        {Value  : bp_BusinessPartner},
        {
            Value: prio,
            Criticality : criticality
        },
        {
            Value   : impact,
            Criticality: criticality
        }
    ]},//FieldGroup
}); //annotate RiskService.Risks - object page