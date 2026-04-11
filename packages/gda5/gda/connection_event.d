/// Module for [ConnectionEvent] class
module gda.connection_event;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ConnectionEvent : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_connection_event_get_type != &gidSymbolNotFound ? gda_connection_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConnectionEvent self()
  {
    return this;
  }

  /**
      Get builder for [gda.connection_event.ConnectionEvent]
      Returns: New builder object
  */
  static ConnectionEventGidBuilder builder()
  {
    return new ConnectionEventGidBuilder;
  }

  /** */
  @property int type()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("type");
  }

  /** */
  @property void type(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("type", propval);
  }

  /** */
  glong getCode()
  {
    glong _retval;
    _retval = gda_connection_event_get_code(cast(GdaConnectionEvent*)this._cPtr);
    return _retval;
  }

  /**
      Get the description of the event. Note that is event's type is GDA_CONNECTION_EVENT_COMMAND,
      the the description is the SQL of the command.
      Returns: event's description.
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gda_connection_event_get_description(cast(GdaConnectionEvent*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get event's severity (from a simple notice to a fatal event)
      Returns: the event type
  */
  gda.types.ConnectionEventType getEventType()
  {
    GdaConnectionEventType _cretval;
    _cretval = gda_connection_event_get_event_type(cast(GdaConnectionEvent*)this._cPtr);
    gda.types.ConnectionEventType _retval = cast(gda.types.ConnectionEventType)_cretval;
    return _retval;
  }

  /**
      Retrieve the code associated to event.
      Returns: the #GdaConnectionEventCode event's code
  */
  gda.types.ConnectionEventCode getGdaCode()
  {
    GdaConnectionEventCode _cretval;
    _cretval = gda_connection_event_get_gda_code(cast(GdaConnectionEvent*)this._cPtr);
    gda.types.ConnectionEventCode _retval = cast(gda.types.ConnectionEventCode)_cretval;
    return _retval;
  }

  /** */
  string getSource()
  {
    const(char)* _cretval;
    _cretval = gda_connection_event_get_source(cast(GdaConnectionEvent*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the SQLSTATE value of event. Even though the SQLSTATE values are specified by ANSI SQL and ODBC,
      consult each DBMS for the possible values. However, the "00000" (success) value means that there is no error,
      and the "HY000" (general error) value means an error but no better error code available.
      Returns: event's SQL state.
  */
  string getSqlstate()
  {
    const(char)* _cretval;
    _cretval = gda_connection_event_get_sqlstate(cast(GdaConnectionEvent*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets event's code: the code is specific to the provider being used.
      If you want to have a common understanding of the event codes, use
      [gda.connection_event.ConnectionEvent.getGdaCode] instead.
      
      This function should not be called directly
  
      Params:
        code = a code.
  */
  void setCode(glong code)
  {
    gda_connection_event_set_code(cast(GdaConnectionEvent*)this._cPtr, code);
  }

  /**
      Sets event's description. This function should not be called directly.
  
      Params:
        description = a description, or null (to unset current description if any)
  */
  void setDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
    gda_connection_event_set_description(cast(GdaConnectionEvent*)this._cPtr, _description);
  }

  /**
      Sets event's severity (from a simple notice to a fatal event)
      This function should not be called directly.
  
      Params:
        type = the severity of the event
  */
  void setEventType(gda.types.ConnectionEventType type)
  {
    gda_connection_event_set_event_type(cast(GdaConnectionEvent*)this._cPtr, type);
  }

  /**
      Sets event's gda code: that code is standardized by the libgda
      library. If you want to specify the corresponding provider specific code,
      use [gda.connection_event.ConnectionEvent.getCode] or [gda.connection_event.ConnectionEvent.getSqlstate] instead.
      
      This function should not be called directly
  
      Params:
        code = a code
  */
  void setGdaCode(gda.types.ConnectionEventCode code)
  {
    gda_connection_event_set_gda_code(cast(GdaConnectionEvent*)this._cPtr, code);
  }

  /**
      Sets event's source; this function should not be called directly
  
      Params:
        source = a source.
  */
  void setSource(string source)
  {
    const(char)* _source = source.toCString(No.Alloc);
    gda_connection_event_set_source(cast(GdaConnectionEvent*)this._cPtr, _source);
  }

  /**
      Changes the SQLSTATE code of event, this function should not be called directly
      
      Sets event's SQL state.
  
      Params:
        sqlstate = SQL state.
  */
  void setSqlstate(string sqlstate)
  {
    const(char)* _sqlstate = sqlstate.toCString(No.Alloc);
    gda_connection_event_set_sqlstate(cast(GdaConnectionEvent*)this._cPtr, _sqlstate);
  }
}

/// Fluent builder implementation template for [gda.connection_event.ConnectionEvent]
class ConnectionEventGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T type(int propval)
  {
    return setProperty("type", propval);
  }
}

/// Fluent builder for [gda.connection_event.ConnectionEvent]
final class ConnectionEventGidBuilder : ConnectionEventGidBuilderImpl!ConnectionEventGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConnectionEvent build()
  {
    return new ConnectionEvent(cast(void*)createGObject(ConnectionEvent._getGType), No.Take);
  }
}
