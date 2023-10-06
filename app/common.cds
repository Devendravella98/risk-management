using riskmanagement as RM from'../db/schema';
annotate RM.Risks with {
    ID @title : 'Risks';
    title @title : 'Title';
    owner @title : 'owner';
    prio @title : 'Priority';
    descr @title : 'Description';
    miti @title : 'Mitigation';
    impact @title : 'Impact';
} 

annotate RM.Mitigations with {
    ID @(
        UI.Hidden,
        Common : { Text : descr}
    );
    owner @title : 'Owner';
    descr @title : 'Description'
}

annotate RM.Risks with {
    miti @(Common : {
        Text : miti.descr,
        TextArrangement : #TextOnly,
        ValueList : {
            Label : 'Mitigations',
            CollectionPath : 'mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr'
                }
            ]
        },
    }
    );
}


