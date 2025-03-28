module gio.mount_operation;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    [gio.mount_operation.MountOperation] provides a mechanism for interacting with the user.
  It can be used for authenticating mountable operations, such as loop
  mounting files, hard drive partitions or server locations. It can
  also be used to ask the user questions or show a list of applications
  preventing unmount or eject operations from completing.
  
  Note that [gio.mount_operation.MountOperation] is used for more than just [gio.mount.Mount]
  objects – for example it is also used in [gio.drive.Drive.start] and
  [gio.drive.Drive.stop].
  
  Users should instantiate a subclass of this that implements all the
  various callbacks to show the required dialogs, such as
  [[gtk.mount_operation.MountOperation]](https://docs.gtk.org/gtk4/class.MountOperation.html).
  If no user interaction is desired (for example when automounting
  filesystems at login time), usually `NULL` can be passed, see each method
  taking a [gio.mount_operation.MountOperation] for details.
  
  Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with TrueCrypt and VeraCrypt’.
  [TrueCrypt](https://en.wikipedia.org/wiki/TrueCrypt) is a discontinued system for
  encrypting file containers, partitions or whole disks, typically used with Windows.
  [VeraCrypt](https://www.veracrypt.fr/) is a maintained fork of TrueCrypt with various
  improvements and auditing fixes.
*/
class MountOperation : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mount_operation_get_type != &gidSymbolNotFound ? g_mount_operation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MountOperation self()
  {
    return this;
  }

  /**
      Creates a new mount operation.
    Returns:     a #GMountOperation.
  */
  this()
  {
    GMountOperation* _cretval;
    _cretval = g_mount_operation_new();
    this(_cretval, Yes.Take);
  }

  /**
      Check to see whether the mount operation is being used
    for an anonymous user.
    Returns:     true if mount operation is anonymous.
  */
  bool getAnonymous()
  {
    bool _retval;
    _retval = g_mount_operation_get_anonymous(cast(GMountOperation*)cPtr);
    return _retval;
  }

  /**
      Gets a choice from the mount operation.
    Returns:     an integer containing an index of the user's choice from
      the choice's list, or `0`.
  */
  int getChoice()
  {
    int _retval;
    _retval = g_mount_operation_get_choice(cast(GMountOperation*)cPtr);
    return _retval;
  }

  /**
      Gets the domain of the mount operation.
    Returns:     a string set to the domain.
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_domain(cast(GMountOperation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Check to see whether the mount operation is being used
    for a TCRYPT hidden volume.
    Returns:     true if mount operation is for hidden volume.
  */
  bool getIsTcryptHiddenVolume()
  {
    bool _retval;
    _retval = g_mount_operation_get_is_tcrypt_hidden_volume(cast(GMountOperation*)cPtr);
    return _retval;
  }

  /**
      Check to see whether the mount operation is being used
    for a TCRYPT system volume.
    Returns:     true if mount operation is for system volume.
  */
  bool getIsTcryptSystemVolume()
  {
    bool _retval;
    _retval = g_mount_operation_get_is_tcrypt_system_volume(cast(GMountOperation*)cPtr);
    return _retval;
  }

  /**
      Gets a password from the mount operation.
    Returns:     a string containing the password within op.
  */
  string getPassword()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_password(cast(GMountOperation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the state of saving passwords for the mount operation.
    Returns:     a #GPasswordSave flag.
  */
  gio.types.PasswordSave getPasswordSave()
  {
    GPasswordSave _cretval;
    _cretval = g_mount_operation_get_password_save(cast(GMountOperation*)cPtr);
    gio.types.PasswordSave _retval = cast(gio.types.PasswordSave)_cretval;
    return _retval;
  }

  /**
      Gets a PIM from the mount operation.
    Returns:     The VeraCrypt PIM within op.
  */
  uint getPim()
  {
    uint _retval;
    _retval = g_mount_operation_get_pim(cast(GMountOperation*)cPtr);
    return _retval;
  }

  /**
      Get the user name from the mount operation.
    Returns:     a string containing the user name.
  */
  string getUsername()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_username(cast(GMountOperation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Emits the #GMountOperation::reply signal.
    Params:
      result =       a #GMountOperationResult
  */
  void reply(gio.types.MountOperationResult result)
  {
    g_mount_operation_reply(cast(GMountOperation*)cPtr, result);
  }

  /**
      Sets the mount operation to use an anonymous user if anonymous is true.
    Params:
      anonymous =       boolean value.
  */
  void setAnonymous(bool anonymous)
  {
    g_mount_operation_set_anonymous(cast(GMountOperation*)cPtr, anonymous);
  }

  /**
      Sets a default choice for the mount operation.
    Params:
      choice =       an integer.
  */
  void setChoice(int choice)
  {
    g_mount_operation_set_choice(cast(GMountOperation*)cPtr, choice);
  }

  /**
      Sets the mount operation's domain.
    Params:
      domain =       the domain to set.
  */
  void setDomain(string domain = null)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    g_mount_operation_set_domain(cast(GMountOperation*)cPtr, _domain);
  }

  /**
      Sets the mount operation to use a hidden volume if hidden_volume is true.
    Params:
      hiddenVolume =       boolean value.
  */
  void setIsTcryptHiddenVolume(bool hiddenVolume)
  {
    g_mount_operation_set_is_tcrypt_hidden_volume(cast(GMountOperation*)cPtr, hiddenVolume);
  }

  /**
      Sets the mount operation to use a system volume if system_volume is true.
    Params:
      systemVolume =       boolean value.
  */
  void setIsTcryptSystemVolume(bool systemVolume)
  {
    g_mount_operation_set_is_tcrypt_system_volume(cast(GMountOperation*)cPtr, systemVolume);
  }

  /**
      Sets the mount operation's password to password.
    Params:
      password =       password to set.
  */
  void setPassword(string password = null)
  {
    const(char)* _password = password.toCString(No.Alloc);
    g_mount_operation_set_password(cast(GMountOperation*)cPtr, _password);
  }

  /**
      Sets the state of saving passwords for the mount operation.
    Params:
      save =       a set of #GPasswordSave flags.
  */
  void setPasswordSave(gio.types.PasswordSave save)
  {
    g_mount_operation_set_password_save(cast(GMountOperation*)cPtr, save);
  }

  /**
      Sets the mount operation's PIM to pim.
    Params:
      pim =       an unsigned integer.
  */
  void setPim(uint pim)
  {
    g_mount_operation_set_pim(cast(GMountOperation*)cPtr, pim);
  }

  /**
      Sets the user name within op to username.
    Params:
      username =       input username.
  */
  void setUsername(string username = null)
  {
    const(char)* _username = username.toCString(No.Alloc);
    g_mount_operation_set_username(cast(GMountOperation*)cPtr, _username);
  }

  /**
      Emitted by the backend when e.g. a device becomes unavailable
    while a mount operation is in progress.
    
    Implementations of GMountOperation should handle this signal
    by dismissing open password dialogs.
  
    ## Parameters
    $(LIST
      * $(B mountOperation) the instance the signal is connected to
    )
  */
  alias AbortedCallbackDlg = void delegate(gio.mount_operation.MountOperation mountOperation);

  /** ditto */
  alias AbortedCallbackFunc = void function(gio.mount_operation.MountOperation mountOperation);

  /**
    Connect to Aborted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAborted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AbortedCallbackDlg) || is(T : AbortedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(_paramVals);
      _dClosure.dlg(mountOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("aborted", closure, after);
  }

  /**
      Emitted when a mount operation asks the user for a password.
    
    If the message contains a line break, the first line should be
    presented as a heading. For example, it may be used as the
    primary text in a #GtkMessageDialog.
  
    ## Parameters
    $(LIST
      * $(B message)       string containing a message to display to the user.
      * $(B defaultUser)       string containing the default user name.
      * $(B defaultDomain)       string containing the default domain.
      * $(B flags)       a set of #GAskPasswordFlags.
      * $(B mountOperation) the instance the signal is connected to
    )
  */
  alias AskPasswordCallbackDlg = void delegate(string message, string defaultUser, string defaultDomain, gio.types.AskPasswordFlags flags, gio.mount_operation.MountOperation mountOperation);

  /** ditto */
  alias AskPasswordCallbackFunc = void function(string message, string defaultUser, string defaultDomain, gio.types.AskPasswordFlags flags, gio.mount_operation.MountOperation mountOperation);

  /**
    Connect to AskPassword signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAskPassword(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AskPasswordCallbackDlg) || is(T : AskPasswordCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(_paramVals);
      auto message = getVal!(string)(&_paramVals[1]);
      auto defaultUser = getVal!(string)(&_paramVals[2]);
      auto defaultDomain = getVal!(string)(&_paramVals[3]);
      auto flags = getVal!(gio.types.AskPasswordFlags)(&_paramVals[4]);
      _dClosure.dlg(message, defaultUser, defaultDomain, flags, mountOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ask-password", closure, after);
  }

  /**
      Emitted when asking the user a question and gives a list of
    choices for the user to choose from.
    
    If the message contains a line break, the first line should be
    presented as a heading. For example, it may be used as the
    primary text in a #GtkMessageDialog.
  
    ## Parameters
    $(LIST
      * $(B message)       string containing a message to display to the user.
      * $(B choices)       an array of strings for each possible choice.
      * $(B mountOperation) the instance the signal is connected to
    )
  */
  alias AskQuestionCallbackDlg = void delegate(string message, string[] choices, gio.mount_operation.MountOperation mountOperation);

  /** ditto */
  alias AskQuestionCallbackFunc = void function(string message, string[] choices, gio.mount_operation.MountOperation mountOperation);

  /**
    Connect to AskQuestion signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAskQuestion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AskQuestionCallbackDlg) || is(T : AskQuestionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(_paramVals);
      auto message = getVal!(string)(&_paramVals[1]);
      auto choices = getVal!(char**)(&_paramVals[2]);
      string[] _choices;
      uint _lenchoices;
      if (choices)
        for (; choices[_lenchoices] !is null; _lenchoices++)
        break;
      foreach (i; 0 .. _lenchoices)
        _choices ~= choices[i].fromCString(No.Free);
      _dClosure.dlg(message, _choices, mountOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ask-question", closure, after);
  }

  /**
      Emitted when the user has replied to the mount operation.
  
    ## Parameters
    $(LIST
      * $(B result)       a #GMountOperationResult indicating how the request was handled
      * $(B mountOperation) the instance the signal is connected to
    )
  */
  alias ReplyCallbackDlg = void delegate(gio.types.MountOperationResult result, gio.mount_operation.MountOperation mountOperation);

  /** ditto */
  alias ReplyCallbackFunc = void function(gio.types.MountOperationResult result, gio.mount_operation.MountOperation mountOperation);

  /**
    Connect to Reply signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectReply(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ReplyCallbackDlg) || is(T : ReplyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(_paramVals);
      auto result = getVal!(gio.types.MountOperationResult)(&_paramVals[1]);
      _dClosure.dlg(result, mountOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reply", closure, after);
  }

  /**
      Emitted when an unmount operation has been busy for more than some time
    (typically 1.5 seconds).
    
    When unmounting or ejecting a volume, the kernel might need to flush
    pending data in its buffers to the volume stable storage, and this operation
    can take a considerable amount of time. This signal may be emitted several
    times as long as the unmount operation is outstanding, and then one
    last time when the operation is completed, with bytes_left set to zero.
    
    Implementations of GMountOperation should handle this signal by
    showing an UI notification, and then dismiss it, or show another notification
    of completion, when bytes_left reaches zero.
    
    If the message contains a line break, the first line should be
    presented as a heading. For example, it may be used as the
    primary text in a #GtkMessageDialog.
  
    ## Parameters
    $(LIST
      * $(B message)       string containing a message to display to the user
      * $(B timeLeft)       the estimated time left before the operation completes,
            in microseconds, or -1
      * $(B bytesLeft)       the amount of bytes to be written before the operation
            completes (or -1 if such amount is not known), or zero if the operation
            is completed
      * $(B mountOperation) the instance the signal is connected to
    )
  */
  alias ShowUnmountProgressCallbackDlg = void delegate(string message, long timeLeft, long bytesLeft, gio.mount_operation.MountOperation mountOperation);

  /** ditto */
  alias ShowUnmountProgressCallbackFunc = void function(string message, long timeLeft, long bytesLeft, gio.mount_operation.MountOperation mountOperation);

  /**
    Connect to ShowUnmountProgress signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowUnmountProgress(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowUnmountProgressCallbackDlg) || is(T : ShowUnmountProgressCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(_paramVals);
      auto message = getVal!(string)(&_paramVals[1]);
      auto timeLeft = getVal!(long)(&_paramVals[2]);
      auto bytesLeft = getVal!(long)(&_paramVals[3]);
      _dClosure.dlg(message, timeLeft, bytesLeft, mountOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-unmount-progress", closure, after);
  }
}
