'use strict';

module.exports = function (Activity) {

  Activity.disableRemoteMethod('__create__aPers', false);
  Activity.disableRemoteMethod('__delete__aPers', false);
  Activity.disableRemoteMethod('__count__aPers', false);
  Activity.disableRemoteMethod('__findById__aPers', false);
  Activity.disableRemoteMethod('__updateById__aPers', false);
  Activity.disableRemoteMethod('__destroyById__aPers', false);

  Activity.disableRemoteMethod('__create__people', false);
  Activity.disableRemoteMethod('__delete__people', false);
  Activity.disableRemoteMethod('__count__people', false);
  Activity.disableRemoteMethod('__findById__people', false);
  Activity.disableRemoteMethod('__updateById__people', false);
  Activity.disableRemoteMethod('__destroyById__people', false);

  Activity.disableRemoteMethod('__create__aTemps', false);
  Activity.disableRemoteMethod('__delete__aTemps', false);
  Activity.disableRemoteMethod('__count__aTemps', false);
  Activity.disableRemoteMethod('__findById__aTemps', false);
  Activity.disableRemoteMethod('__updateById__aTemps', false);
  Activity.disableRemoteMethod('__destroyById__aTemps', false);

  Activity.copyTxtName = function (id, cb) {
    var ds = Activity.dataSource;
    var sql = "UPDATE event e SET e.name = (SELECT a.name FROM activity a WHERE a.id = e.activity_id) WHERE e.activity_id = " + id;
    ds.connector.execute(sql, function (err, copyTxtName) {
      if (err)
        console.error(err);
      cb(err, copyTxtName);
    });
  }

  Activity.copyTxtContent = function (id, cb) {
    var ds = Activity.dataSource;
    var sql = "UPDATE event e SET e.content = (SELECT a.content FROM activity a WHERE a.id = e.activity_id) WHERE e.activity_id = " + id;
    ds.connector.execute(sql, function (err, copyTxtContent) {
      if (err)
        console.error(err);
      cb(err, copyTxtContent);
    });
  }

  Activity.remoteMethod('copyTxtName', {
    http: {
      verb: 'post',
      path: '/:id/copyTxtName'
    },
    accepts: {
      arg: 'id',
      type: 'number',
      required: true,
      description: 'activity id'
    },
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Update events of activity',
    notes: 'This custom method updates name of activity events, based on provided activity id.'
  });

  Activity.remoteMethod('copyTxtContent', {
    http: {
      verb: 'post',
      path: '/:id/copyTxtContent'
    },
    accepts: {
      arg: 'id',
      type: 'number',
      required: true,
      description: 'activity id'
    },
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Update events of activity',
    notes: 'This custom method updates content of activity events, based on provided activity id.'
  });



};
