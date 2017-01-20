'use strict';

module.exports = function(Vplocation) {
    Vplocation.partners = function (id, cb) {
        var ds = Vplocation.dataSource;
        var sql = "SELECT DISTINCT partner_id, partName FROM v_plocation where person_id=" + id;
        ds.connector.execute(sql, function (err, partners) {
            if (err)
                console.error(err);
            cb(err, partners);
        });
    }

    Vplocation.remoteMethod('partners', {
        http: { verb: 'get', path: '/:id/partners' },
        accepts: { arg: 'id', type: 'number', required: true, description: 'person id' },
        returns: { type: 'Object', root: true },
        description: 'Get partners of person', notes: 'This custom method returns distinct partners of provided person id.'
    });
};
