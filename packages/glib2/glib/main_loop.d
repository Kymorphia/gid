/// Module for [MainLoop] class
module glib.main_loop;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.main_context;
import glib.types;
import gobject.boxed;

/**
    The [glib.main_loop.MainLoop] struct is an opaque data type
    representing the main event loop of a GLib or GTK application.
*/
class MainLoop : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_main_loop_get_type != &gidSymbolNotFound ? g_main_loop_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MainLoop self()
  {
    return this;
  }

  /**
      Creates a new #GMainLoop structure.
  
      Params:
        context = a #GMainContext  (if null, the global-default
            main context will be used).
        isRunning = set to true to indicate that the loop is running. This
          is not very important since calling [glib.main_loop.MainLoop.run] will set this to
          true anyway.
      Returns: a new #GMainLoop.
  */
  this(glib.main_context.MainContext context, bool isRunning)
  {
    GMainLoop* _cretval;
    _cretval = g_main_loop_new(context ? cast(GMainContext*)context._cPtr(No.Dup) : null, isRunning);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the #GMainContext of loop.
      Returns: the #GMainContext of loop
  */
  glib.main_context.MainContext getContext()
  {
    GMainContext* _cretval;
    _cretval = g_main_loop_get_context(cast(GMainLoop*)this._cPtr);
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks to see if the main loop is currently being run via [glib.main_loop.MainLoop.run].
      Returns: true if the mainloop is currently being run.
  */
  bool isRunning()
  {
    bool _retval;
    _retval = cast(bool)g_main_loop_is_running(cast(GMainLoop*)this._cPtr);
    return _retval;
  }

  /**
      Stops a #GMainLoop from running. Any calls to [glib.main_loop.MainLoop.run]
      for the loop will return.
      
      Note that sources that have already been dispatched when
      [glib.main_loop.MainLoop.quit] is called will still be executed.
  */
  void quit()
  {
    g_main_loop_quit(cast(GMainLoop*)this._cPtr);
  }

  /**
      Runs a main loop until [glib.main_loop.MainLoop.quit] is called on the loop.
      If this is called for the thread of the loop's #GMainContext,
      it will process events from the loop, otherwise it will
      simply wait.
  */
  void run()
  {
    g_main_loop_run(cast(GMainLoop*)this._cPtr);
  }
}
