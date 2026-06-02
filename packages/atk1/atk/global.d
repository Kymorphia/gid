/// Global functions for atk1 library
module atk.global;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.registry;
import atk.types;
import gid.gid;
import gobject.object;


/**
    Cause the focus tracker functions which have been specified to be
    executed for the object.

    Params:
      object = an #AtkObject

    Deprecated: Focus tracking has been dropped as a feature
      to be implemented by ATK itself. As #AtkObject::focus-event was
      deprecated in favor of a #AtkObject::state-change signal, in order
      to notify a focus change on your implementation, you can use
      [atk.object.ObjectWrap.notifyStateChange] instead.
*/
void focusTrackerNotify(atk.object.ObjectWrap object) nothrow
{
  atk_focus_tracker_notify(object ? cast(AtkObject*)object._cPtr(No.Dup) : null);
}

/**
    Returns the binary age as passed to libtool when building the ATK
    library the process is running against.
    Returns: the binary age of the ATK library
*/
uint getBinaryAge() nothrow
{
  uint _retval;
  _retval = atk_get_binary_age();
  return _retval;
}

/**
    Gets a default implementation of the #AtkObjectFactory/type
    registry.
    Note: For most toolkit maintainers, this will be the correct
    registry for registering new #AtkObject factories. Following
    a call to this function, maintainers may call [atk.registry.Registry.setFactoryType]
    to associate an #AtkObjectFactory subclass with the GType of objects
    for whom accessibility information will be provided.
    Returns: a default implementation of the
      #AtkObjectFactory/type registry
*/
atk.registry.Registry getDefaultRegistry() nothrow
{
  AtkRegistry* _cretval;
  _cretval = atk_get_default_registry();
  auto _retval = gobject.object.ObjectWrap._getDObject!(atk.registry.Registry)(cast(AtkRegistry*)_cretval, Yes.Take);
  return _retval;
}

/**
    Gets the currently focused object.
    Returns: the currently focused object for the current
      application
*/
atk.object.ObjectWrap getFocusObject() nothrow
{
  AtkObject* _cretval;
  _cretval = atk_get_focus_object();
  auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
  return _retval;
}

/**
    Returns the interface age as passed to libtool when building the
    ATK library the process is running against.
    Returns: the interface age of the ATK library
*/
uint getInterfaceAge() nothrow
{
  uint _retval;
  _retval = atk_get_interface_age();
  return _retval;
}

/**
    Returns the major version number of the ATK library.  (e.g. in ATK
    version 2.7.4 this is 2.)
    
    This function is in the library, so it represents the ATK library
    your code is running against. In contrast, the #ATK_MAJOR_VERSION
    macro represents the major version of the ATK headers you have
    included when compiling your code.
    Returns: the major version number of the ATK library
*/
uint getMajorVersion() nothrow
{
  uint _retval;
  _retval = atk_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the ATK library.  (e.g. in ATK
    version 2.7.4 this is 4.)
    
    This function is in the library, so it represents the ATK library
    your code is are running against. In contrast, the
    #ATK_MICRO_VERSION macro represents the micro version of the ATK
    headers you have included when compiling your code.
    Returns: the micro version number of the ATK library
*/
uint getMicroVersion() nothrow
{
  uint _retval;
  _retval = atk_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the ATK library.  (e.g. in ATK
    version 2.7.4 this is 7.)
    
    This function is in the library, so it represents the ATK library
    your code is are running against. In contrast, the
    #ATK_MINOR_VERSION macro represents the minor version of the ATK
    headers you have included when compiling your code.
    Returns: the minor version number of the ATK library
*/
uint getMinorVersion() nothrow
{
  uint _retval;
  _retval = atk_get_minor_version();
  return _retval;
}

/**
    Gets the root accessible container for the current application.
    Returns: the root accessible container for the current
      application
*/
atk.object.ObjectWrap getRoot() nothrow
{
  AtkObject* _cretval;
  _cretval = atk_get_root();
  auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
  return _retval;
}

/**
    Gets name string for the GUI toolkit implementing ATK for this application.
    Returns: name string for the GUI toolkit implementing ATK for this application
*/
string getToolkitName() nothrow
{
  const(char)* _cretval;
  _cretval = atk_get_toolkit_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets version string for the GUI toolkit implementing ATK for this application.
    Returns: version string for the GUI toolkit implementing ATK for this application
*/
string getToolkitVersion() nothrow
{
  const(char)* _cretval;
  _cretval = atk_get_toolkit_version();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the current version for ATK.
    Returns: version string for ATK
*/
string getVersion() nothrow
{
  const(char)* _cretval;
  _cretval = atk_get_version();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Removes the specified focus tracker from the list of functions
    to be called when any object receives focus.

    Params:
      trackerId = the id of the focus tracker to remove

    Deprecated: Focus tracking has been dropped as a feature
        to be implemented by ATK itself. If you need focus tracking on your
        implementation, subscribe to the #AtkObject::state-change "focused"
        signal.
*/
void removeFocusTracker(uint trackerId) nothrow
{
  atk_remove_focus_tracker(trackerId);
}

/**
    listener_id is the value returned by #atk_add_global_event_listener
    when you registered that event listener.
    
    Toolkit implementor note: ATK provides a default implementation for
    this virtual method. ATK implementors are discouraged from
    reimplementing this method.
    
    Toolkit implementor note: this method is not intended to be used by
    ATK implementors but by ATK consumers.
    
    Removes the specified event listener

    Params:
      listenerId = the id of the event listener to remove
*/
void removeGlobalEventListener(uint listenerId) nothrow
{
  atk_remove_global_event_listener(listenerId);
}

/**
    listener_id is the value returned by #atk_add_key_event_listener
    when you registered that event listener.
    
    Removes the specified event listener.

    Params:
      listenerId = the id of the event listener to remove
*/
void removeKeyEventListener(uint listenerId) nothrow
{
  atk_remove_key_event_listener(listenerId);
}
