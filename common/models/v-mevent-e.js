'use strict';

module.exports = function (Vmevente) {
    Vmevente.people = function (id, cb) {
        var ds = Vmevente.dataSource;
        var sql = "SELECT DISTINCT person_id, firstname, lastname FROM v_mevent_e " +
        "where (eAcc = 1 and (eOff is null or eOff = 0) ) and  location_id=" + id + " order by lastname, firstname";
        ds.connector.execute(sql, function (err, people) {
            if (err)
                console.error(err);
            cb(err, people);
        });
    }

    Vmevente.remoteMethod('people', {
    http: {
      verb: 'get',
      path: '/:id/people'
    },
    accepts: {
      arg: 'id',
      type: 'number',
      required: true,
      description: 'location id'
    },
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Get registered people of location',
    notes: 'This custom method returns registered people of provided location id.'
  });

};
