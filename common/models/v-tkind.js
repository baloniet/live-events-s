'use strict';

module.exports = function (Vtkind) {

    Vtkind.themes = function (id, cb) {
        var ds = Vtkind.dataSource;
        var sql = "SELECT DISTINCT theme_id, themeName FROM v_tkind where partner_id=" + id;
        ds.connector.execute(sql, function (err, themes) {
            if (err)
                console.error(err);
            cb(err, themes);
        });
    }

    Vtkind.remoteMethod('themes', {
        http: { verb: 'get', path: '/:id/themes' },
        accepts: { arg: 'id', type: 'number', required: true, description: 'partner id' },
        returns: { type: 'Object', root: true },
        description: 'Get themes of partner', notes: 'This custom method returns distinct themes of provided partner id.'
    });

};