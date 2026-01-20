/// Module for [Window] interface
module atk.window;

public import atk.window_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.dclosure;

/**
    The ATK Interface provided by UI components that represent a top-level window.
    
    #AtkWindow should be implemented by the UI elements that represent
    a top-level window, such as the main window of an application or
    dialog.
    
    See `class@AtkObject`
*/
interface Window
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_window_get_type != &gidSymbolNotFound ? atk_window_get_type() : cast(GType)0;
  }

  /**
      Connect to `Activate` signal.
  
      The signal #AtkWindow::activate is emitted when a window
        becomes the active window of the application or session.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Create` signal.
  
      The signal #AtkWindow::create is emitted when a new window
        is created.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreate(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Deactivate` signal.
  
      The signal #AtkWindow::deactivate is emitted when a window is
        no longer the active window of the application or session.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeactivate(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Destroy` signal.
  
      The signal #AtkWindow::destroy is emitted when a window is
        destroyed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDestroy(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Maximize` signal.
  
      The signal #AtkWindow::maximize is emitted when a window
        is maximized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMaximize(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Minimize` signal.
  
      The signal #AtkWindow::minimize is emitted when a window
        is minimized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMinimize(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Move` signal.
  
      The signal #AtkWindow::move is emitted when a window
        is moved.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMove(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Resize` signal.
  
      The signal #AtkWindow::resize is emitted when a window
        is resized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResize(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `Restore` signal.
  
      The signal #AtkWindow::restore is emitted when a window
        is restored.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRestore(T)(T callback, Flag!"After" after = No.After);
}
