'use strict';

module.exports = function (Person) {
    Person.disableRemoteMethod('__create__phones', false);
    Person.disableRemoteMethod('__delete__phones', false);
    Person.disableRemoteMethod('__count__phones', false);
    Person.disableRemoteMethod('__findById__phones', false);
    Person.disableRemoteMethod('__updateById__phones', false);
    Person.disableRemoteMethod('__destroyById__phones', false);

    Person.disableRemoteMethod('__create__emails', false);
    Person.disableRemoteMethod('__delete__emails', false);
    Person.disableRemoteMethod('__count__emails', false);
    Person.disableRemoteMethod('__findById__emails', false);
    Person.disableRemoteMethod('__updateById__emails', false);
    Person.disableRemoteMethod('__destroyById__emails', false);

    Person.disableRemoteMethod('__create__edu', false);
    Person.disableRemoteMethod('__delete__edu', false);
    Person.disableRemoteMethod('__count__edu', false);
    Person.disableRemoteMethod('__findById__edu', false);
    Person.disableRemoteMethod('__updateById__edu', false);
    Person.disableRemoteMethod('__destroyById__edu', false);

    Person.disableRemoteMethod('__create__citi', false);
    Person.disableRemoteMethod('__delete__citi', false);
    Person.disableRemoteMethod('__count__citi', false);
    Person.disableRemoteMethod('__findById__citi', false);
    Person.disableRemoteMethod('__updateById__citi', false);
    Person.disableRemoteMethod('__destroyById__citi', false);

    Person.disableRemoteMethod('__create__addss', false);
    Person.disableRemoteMethod('__delete__addss', false);
    Person.disableRemoteMethod('__count__addss', false);
    Person.disableRemoteMethod('__findById__addss', false);
    Person.disableRemoteMethod('__updateById__addss', false);
    Person.disableRemoteMethod('__destroyById__addss', false);

    Person.disableRemoteMethod('__create__statements', false);
    Person.disableRemoteMethod('__delete__statements', false);
    Person.disableRemoteMethod('__count__statements', false);
    Person.disableRemoteMethod('__findById__statements', false);
    Person.disableRemoteMethod('__updateById__statements', false);
    Person.disableRemoteMethod('__destroyById__statements', false);

    Person.disableRemoteMethod('__create__stats', false);
    Person.disableRemoteMethod('__delete__stats', false);
    Person.disableRemoteMethod('__count__stats', false);
    Person.disableRemoteMethod('__findById__stats', false);
    Person.disableRemoteMethod('__updateById__stats', false);
    Person.disableRemoteMethod('__destroyById__stats', false);

};