'use strict';

module.exports = function (Vplocation) {
  Vplocation.partners = function (id, cb) {
    var ds = Vplocation.dataSource;
    var sql = "SELECT DISTINCT partner_id, partName FROM v_plocation where person_id=" + id + " order by partName";
    ds.connector.execute(sql, function (err, partners) {
      if (err)
        console.error(err);
      cb(err, partners);
    });
  }

  Vplocation.locations = function (id, cb) {
    var ds = Vplocation.dataSource;
    var sql = "SELECT id, name FROM v_plocation where person_id=" + id + " order by partName,name";
    ds.connector.execute(sql, function (err, locations) {
      if (err)
        console.error(err);
      cb(err, locations);
    });
  }

  Vplocation.remoteMethod('partners', {
    http: {
      verb: 'get',
      path: '/:id/partners'
    },
    accepts: {
      arg: 'id',
      type: 'number',
      required: true,
      description: 'person id'
    },
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Get partners of person',
    notes: 'This custom method returns distinct partners of provided person id.'
  });

  Vplocation.remoteMethod('locations', {
    http: {
      verb: 'get',
      path: '/:id/locations'
    },
    accepts: {
      arg: 'id',
      type: 'number',
      required: true,
      description: 'person id'
    },
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Get locations of person',
    notes: 'This custom method returns distinct locations of provided person id.'
  });
};
