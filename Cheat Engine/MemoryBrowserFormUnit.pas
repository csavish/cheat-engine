unit MemoryBrowserFormUnit;

{$MODE Delphi}

interface

uses
  jwawindows, windows, LCLProc, LCLIntf, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, frmMemoryAllocHandlerUnit, math, StdCtrls, Spin,
  ExtCtrls,CEFuncProc,symbolhandler,Clipbrd, Menus,plugin,CEDebugger,KernelDebugger,
  Assemblerunit,disassembler,addressparser, Buttons,imagehlp, Contnrs,
  disassemblerviewunit, peinfofunctions ,dissectcodethread,stacktrace2,
  NewKernelHandler, ComCtrls, LResources, byteinterpreter, StrUtils, hexviewunit,
  debughelper, debuggertypedefinitions,frmMemviewPreferencesUnit, registry,
  scrollboxex, disassemblercomments, multilineinputqueryunit, frmMemoryViewExUnit,
  LastDisassembleData, ProcessHandlerUnit, commonTypeDefs;


type

  { TMemoryBrowser }

  TMemoryBrowser = class(TForm)
    dispQwords: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    dispChar: TMenuItem;
    dispShorts: TMenuItem;
    DispLongs: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    miTextEncoding8: TMenuItem;
    miTextEncoding16: TMenuItem;
    miReferencedFunctions: TMenuItem;
    miUserDefinedHeader: TMenuItem;
    miShowIndisassembler: TMenuItem;
    miShowInHexview: TMenuItem;
    miCopyBytesOnly: TMenuItem;
    miDissectData2: TMenuItem;
    miPointerSpider: TMenuItem;
    MenuItem9: TMenuItem;
    miDisassembly32: TMenuItem;
    miDisassembly64: TMenuItem;
    miDisassemblyAutodetect: TMenuItem;
    miDisassemblerType: TMenuItem;
    miAddEBP: TMenuItem;
    miAddESP: TMenuItem;
    miFindWhatWrites: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    miFindWhatAccesses: TMenuItem;
    miDeleteBP: TMenuItem;
    miLock: TMenuItem;
    miShowDifference: TMenuItem;
    miUserdefinedComment: TMenuItem;
    miSepEvery4Bytes: TMenuItem;
    miSepEvery8Bytes: TMenuItem;
    miSepEvery2Bytes: TMenuItem;
    miSeperators: TMenuItem;
    miConditionalBreak: TMenuItem;
    miTextPreferences: TMenuItem;
    miLuaEngine: TMenuItem;
    miPaging: TMenuItem;
    miDebugEvents: TMenuItem;
    miLockRowsize: TMenuItem;
    memorypopup: TPopupMenu;
    Goto1: TMenuItem;
    debuggerpopup: TPopupMenu;
    pmRegisters: TPopupMenu;
    sbShowFloats: TButton;
    Timer2: TTimer;
    Panel1: TPanel;
    Panel4: TPanel;
    miReplacewithnops: TMenuItem;
    Gotoaddress1: TMenuItem;
    Search1: TMenuItem;
    Change1: TMenuItem;
    Addthisaddresstothelist1: TMenuItem;
    miAddToTheCodelist: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Splitter1: TSplitter;
    Panel5: TPanel;
    RegisterView: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Loadsymbolfile1: TMenuItem;
    Debug1: TMenuItem;
    Step1: TMenuItem;
    StepOver1: TMenuItem;
    Runtill1: TMenuItem;
    Setbreakpoint1: TMenuItem;
    View1: TMenuItem;
    Stacktrace1: TMenuItem;
    ScrollBox1: TScrollBox;
    EAXLabel: TLabel;
    EBXlabel: TLabel;
    ECXlabel: TLabel;
    EDXlabel: TLabel;
    ESIlabel: TLabel;
    EDIlabel: TLabel;
    EBPlabel: TLabel;
    ESPlabel: TLabel;
    EIPlabel: TLabel;
    CSLabel: TLabel;
    DSLabel: TLabel;
    SSlabel: TLabel;
    ESlabel: TLabel;
    FSlabel: TLabel;
    GSlabel: TLabel;
    cflabel: TLabel;
    pflabel: TLabel;
    aflabel: TLabel;
    zflabel: TLabel;
    sflabel: TLabel;
    oflabel: TLabel;
    Label14: TLabel;
    Shape1: TShape;
    Label15: TLabel;
    Shape2: TShape;
    Label16: TLabel;
    Shape3: TShape;
    Run1: TMenuItem;
    Threadlist1: TMenuItem;
    Assemble1: TMenuItem;
    N3: TMenuItem;
    Break1: TMenuItem;
    Extra1: TMenuItem;
    Reservememory1: TMenuItem;
    Savedisassemledoutput1: TMenuItem;
    Savememoryregion1: TMenuItem;
    Loadmemolryregion1: TMenuItem;
    N4: TMenuItem;
    OpenMemory: TOpenDialog;
    Debugstrings1: TMenuItem;
    CreateThread1: TMenuItem;
    MemoryRegions1: TMenuItem;
    FillMemory1: TMenuItem;
    Disectwindow1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Heaps1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    EnumeratedllsandSymbols1: TMenuItem;
    InjectDLL1: TMenuItem;
    OpenDllDialog: TOpenDialog;
    AutoInject1: TMenuItem;
    Dissectcode1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Findstaticpointers1: TMenuItem;
    Scanforcodecaves1: TMenuItem;
    Changestateofregisteratthislocation1: TMenuItem;
    miTogglebreakpoint: TMenuItem;
    Breakpointlist1: TMenuItem;
    Makepagewritable1: TMenuItem;
    Dissectdata1: TMenuItem;
    N10: TMenuItem;
    Showsymbols1: TMenuItem;
    miDissectData: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Showmoduleaddresses1: TMenuItem;
    Symbolhandler1: TMenuItem;
    Kerneltools1: TMenuItem;
    Allocatenonpagedmemory1: TMenuItem;
    Getaddress1: TMenuItem;
    Search2: TMenuItem;
    Assemblycode1: TMenuItem;
    Findmemory1: TMenuItem;
    Driverlist1: TMenuItem;
    Plugins1: TMenuItem;
    Sericedescriptortable1: TMenuItem;
    N13: TMenuItem;
    Cut1: TMenuItem;
    Pastefromclipboard1: TMenuItem;
    N14: TMenuItem;
    Setsymbolsearchpath1: TMenuItem;
    Kernelmodesymbols1: TMenuItem;
    Breakandtraceinstructions1: TMenuItem;
    GDTlist1: TMenuItem;
    IDTlist1: TMenuItem;
    Newwindow1: TMenuItem;
    Follow1: TMenuItem;
    dflabel: TLabel;
    Copytoclipboard1: TMenuItem;
    copyBytes: TMenuItem;
    copyOpcodes: TMenuItem;
    CopyBytesAndOpcodes: TMenuItem;
    DissectPEheaders1: TMenuItem;
    Back1: TMenuItem;
    Showvaluesofstaticaddresses1: TMenuItem;
    Findoutwhataddressesthisinstructionaccesses1: TMenuItem;
    DisplayType1: TMenuItem;
    N15: TMenuItem;
    dispBytes: TMenuItem;
    dispWords: TMenuItem;
    dispDwords: TMenuItem;
    dispFloat: TMenuItem;
    dispDouble: TMenuItem;
    dispInts: TMenuItem;
    Jumplines1: TMenuItem;
    Showjumplines1: TMenuItem;
    Onlyshowjumplineswithinrange1: TMenuItem;
    Watchmemoryallocations1: TMenuItem;
    Continueanddetachdebugger1: TMenuItem;
    N16: TMenuItem;
    Panel3: TPanel;
    Splitter3: TSplitter;
    pnlStacktrace: TPanel;
    pmStacktrace: TPopupMenu;
    All1: TMenuItem;
    Modulesonly1: TMenuItem;
    Nonsystemmodulesonly1: TMenuItem;
    lvStacktraceData: TListView;
    N17: TMenuItem;
    Maxstacktracesize1: TMenuItem;
    Splitter2: TSplitter;
    Referencedstrings1: TMenuItem;
    N18: TMenuItem;
    stacktrace2: TMenuItem;
    Executetillreturn1: TMenuItem;
    procedure memorypopupPopup(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure miTextEncodingClick(Sender: TObject);
    procedure miReferencedFunctionsClick(Sender: TObject);
    procedure miShowIndisassemblerClick(Sender: TObject);
    procedure miCopyBytesOnlyClick(Sender: TObject);
    procedure miDissectData2Click(Sender: TObject);
    procedure miPointerSpiderClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure miAddESPClick(Sender: TObject);
    procedure miConditionalBreakClick(Sender: TObject);
    procedure miDeleteBPClick(Sender: TObject);
    procedure miDisassemblyAutodetectClick(Sender: TObject);
    procedure miFindWhatAccessesClick(Sender: TObject);
    procedure miFindWhatWritesClick(Sender: TObject);
    procedure miSepClick(Sender: TObject);
    procedure miShowInHexviewClick(Sender: TObject);
    procedure miTextPreferencesClick(Sender: TObject);
    procedure miDebugEventsClick(Sender: TObject);
    procedure miLuaEngineClick(Sender: TObject);
    procedure miPagingClick(Sender: TObject);
    procedure miUserdefinedCommentClick(Sender: TObject);
    procedure miUserDefinedHeaderClick(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure RegisterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miLockRowsizeClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure ScrollBox1ConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: TConstraintSize);
    procedure ScrollBox1Paint(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Goto1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure miReplacewithnopsClick(Sender: TObject);

    procedure FControl1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FControl1KeyPress(Sender: TObject; var Key: Char);
    procedure Gotoaddress1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure Change1Click(Sender: TObject);
    procedure Addthisaddresstothelist1Click(Sender: TObject);
    procedure miAddToTheCodelistClick(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure ScrollBar2Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Run1Click(Sender: TObject);
    procedure Step1Click(Sender: TObject);
    procedure StepOver1Click(Sender: TObject);
    procedure Runtill1Click(Sender: TObject);
    procedure Stacktrace1Click(Sender: TObject);
    procedure Threadlist1Click(Sender: TObject);
    procedure Assemble1Click(Sender: TObject);
    procedure HexEditKeyPress(Sender: TObject; var Key: Char);
    procedure HexEditExit(Sender: TObject);
    procedure HexEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAXLabelDblClick(Sender: TObject);
    procedure Break1Click(Sender: TObject);
    procedure Reservememory1Click(Sender: TObject);
    procedure Savememoryregion1Click(Sender: TObject);
    procedure Loadmemolryregion1Click(Sender: TObject);
    procedure HexEditDblClick(Sender: TObject);
    procedure Debugstrings1Click(Sender: TObject);
    procedure TextEditExit(Sender: TObject);
    procedure TextEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreateThread1Click(Sender: TObject);
    procedure MemoryRegions1Click(Sender: TObject);
    procedure TextEditKeyPress(Sender: TObject; var Key: Char);
    procedure FillMemory1Click(Sender: TObject);
    procedure Disectwindow1Click(Sender: TObject);
    procedure Savedisassemledoutput1Click(Sender: TObject);
    procedure Heaps1Click(Sender: TObject);
    procedure EnumeratedllsandSymbols1Click(Sender: TObject);
    procedure InjectDLL1Click(Sender: TObject);
    procedure AutoInject1Click(Sender: TObject);
    procedure Dissectcode1Click(Sender: TObject);
    procedure Createjumptocodecave1Click(Sender: TObject);
    procedure Findstaticpointers1Click(Sender: TObject);
    procedure Scanforcodecaves1Click(Sender: TObject);
    procedure Changestateofregisteratthislocation1Click(Sender: TObject);
    procedure miTogglebreakpointClick(Sender: TObject);
    procedure Breakpointlist1Click(Sender: TObject);
    procedure Makepagewritable1Click(Sender: TObject);
    procedure Dissectdata1Click(Sender: TObject);
    procedure Showsymbols1Click(Sender: TObject);
    procedure miDissectDataClick(Sender: TObject);
    procedure Showmoduleaddresses1Click(Sender: TObject);
    procedure Symbolhandler1Click(Sender: TObject);
    procedure Allocatenonpagedmemory1Click(Sender: TObject);
    procedure Getaddress1Click(Sender: TObject);
    procedure Findmemory1Click(Sender: TObject);
    procedure Assemblycode1Click(Sender: TObject);
    procedure Driverlist1Click(Sender: TObject);
    procedure Sericedescriptortable1Click(Sender: TObject);
    procedure MBCanvasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Cut1Click(Sender: TObject);
    procedure Pastefromclipboard1Click(Sender: TObject);
    procedure Setsymbolsearchpath1Click(Sender: TObject);
    procedure Kernelmodesymbols1Click(Sender: TObject);
    procedure Breakandtraceinstructions1Click(Sender: TObject);
    procedure debuggerpopupPopup(Sender: TObject);
    procedure GDTlist1Click(Sender: TObject);
    procedure IDTlist1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Newwindow1Click(Sender: TObject);
    procedure Follow1Click(Sender: TObject);
    procedure CopyBytesAndOpcodesClick(Sender: TObject);
    procedure DissectPEheaders1Click(Sender: TObject);
    procedure Back1Click(Sender: TObject);
    procedure Showvaluesofstaticaddresses1Click(Sender: TObject);
    procedure Findoutwhataddressesthisinstructionaccesses1Click(
      Sender: TObject);
    procedure sbShowFloatsClick(Sender: TObject);
    procedure ScriptConsole1Click(Sender: TObject);
    procedure DisplayTypeClick(Sender: TObject);
    procedure Showjumplines1Click(Sender: TObject);
    procedure Onlyshowjumplineswithinrange1Click(Sender: TObject);
    procedure Watchmemoryallocations1Click(Sender: TObject);
    procedure Continueanddetachdebugger1Click(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure Maxstacktracesize1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure Modulesonly1Click(Sender: TObject);
    procedure Nonsystemmodulesonly1Click(Sender: TObject);
    procedure Referencedstrings1Click(Sender: TObject);
    procedure stacktrace2Click(Sender: TObject);
    procedure Executetillreturn1Click(Sender: TObject);
    procedure lvStacktraceDataData(Sender: TObject; Item: TListItem);
    procedure lvStacktraceDataDblClick(Sender: TObject);
  private
    { Private declarations }

    R8Label: TLabel;
    R9Label: TLabel;
    R10Label: TLabel;
    R11Label: TLabel;
    R12Label: TLabel;
    R13Label: TLabel;
    R14Label: TLabel;
    R15Label: TLabel;


    posloadedfromreg: boolean;
    displaytype: TDisplayType;


    editing: boolean;
    editing2: boolean;

    srow,scolumn: integer;


    memorylabelcount: integer;
    addresslabelcount: integer;
    addresslabel: array of TLabel;
    memorylabel: array of TLabel; //hex
    memoryLabelA: array of TLabel; //ascii
    MemoryLabelVerticalLines: integer;  //number of rows
    MemoryLabelHorizontalLines: Integer;  //the number of lines

    addressestext: array of string[8];
    memorytext: array of string[2];
    memorystring: array of string;
    lengthof8bytes: Integer;

//        x:tno

    lines: integer;
    oldlines: integer;
    Highlightcolor: Tcolor;

    numberofaddresses: integer;


    part: integer;


    lastmodulelistupdate: integer;

    disassemblerHistory: TStringList;
    memorybrowserHistory: TStringList;
    assemblerHistory: TStringList;

    backlist: TStack;

    lastspecialwidth: integer;
    FShowValues: boolean;
    FShowDebugPanels: boolean;
    FStacktraceSize: integer;

    strace: Tstringlist;

    lastBreakpointCondition: record
      script: string;
      easy: boolean;
    end;

    procedure SetStacktraceSize(size: integer);
    procedure setShowDebugPanels(state: boolean);
    procedure UpdateRWAddress(disasm: string);
    procedure WMGetMinMaxInfo(var Message: TMessage); message WM_GETMINMAXINFO;
    function getShowValues: boolean;
    procedure setShowValues(newstate: boolean);


    procedure disassemblerviewDblClick(Sender: TObject);
    procedure setHexviewAddress(a: ptrUint);
    function getHexviewAddress:ptrUint;
    procedure hexviewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setContextValueByTag(value: ptruint; tag: integer);
    function  getContextValueByTag(tag: integer): ptruint;
  public
    { Public declarations }
    FSymbolsLoaded: Boolean;



    thhandle: Thandle;

    disassemblerview: TDisassemblerview;
    hexview: THexview;

    lastdebugcontextarm: TARMCONTEXT;
    lastdebugcontext: _Context;
    laststack: pbytearray;

    disassembler: boolean;
    cancelsearch: boolean;

    ischild: boolean; //determines if it's the main memorybrowser or a child


    procedure FindwhatThiscodeAccesses(address: ptrUint);

    procedure AssemblePopup(x: string);

    procedure plugintype1click(sender:tobject);
    procedure plugintype6click(sender:tobject);
    procedure setcodeanddatabase;
    procedure GetEntryPointAndDataBase(var code: ptrUint; var data: ptrUint);
    property showvalues: boolean read getShowValues write setShowValues;
    property showDebugPanels: boolean read fShowDebugPanels write setShowDebugPanels;
    property stacktraceSize: integer read FStacktraceSize write SetStacktraceSize;
    property memoryaddress: ptrUint read getHexviewAddress write setHexviewAddress;
    procedure reloadStacktrace;
    function GetReturnaddress: ptrUint;

    procedure UpdateDebugContext(threadhandle: THandle; threadid: dword);
    procedure miLockOnClick(Sender: TObject);
    procedure miLockMemviewClick(sender: TObject);

    procedure miDifferenceClick(Sender: TObject);
    procedure miStopDifferenceClick(Sender: TObject);
    procedure Scrollboxscroll(sender: TObject);
    procedure AddToDisassemblerBackList(address: pointer);
  end;

var
  MemoryBrowser: TMemoryBrowser;
  mbchildcount: integer; //global so all other children can increase it as well


  MemoryBrowsers: TList; //contains a list of all the memorybrowsers
  
implementation

uses Valuechange,
  MainUnit,
  debugeventhandler,

  findwindowunit,
  frmstacktraceunit,
  frmBreakThreadUnit,
  FormDebugStringsUnit,
  frmDissectWindowUnit,
  frmEnumerateDLLsUnit,
  frmThreadlistunit,
  formmemoryregionsunit,
  frmHeapsUnit,
  frmFindstaticsUnit,
  frmModifyRegistersUnit,

  savedisassemblyfrm,
  frmBreakpointlistunit,
  AdvancedOptionsUnit,
  frmautoinjectunit,
  formsettingsunit,
  frmSaveMemoryRegionUnit,
  frmLoadMemoryunit,
  inputboxtopunit,
  formAddToCodeList,
  frmFillMemoryUnit,
  frmCodecaveScannerUnit,
  FoundCodeUnit,
  frmSelectionlistunit,
  symbolconfigunit,
  frmFloatingPointPanelUnit,
  frmTracerUnit,
  dissectcodeunit,
  driverlist,
  formChangedAddresses,
  peINFOunit,
  frmGDTunit,
  frmIDTunit,
  frmDisassemblyscanunit,
  ServiceDescriptorTables,
  frmReferencedStringsUnit,
  frmReferencedFunctionsUnit,
  Structuresfrm,
  Structuresfrm2,
  pointerscannerfrm,
  frmDebugEventsUnit,
  frmPagingUnit,
  frmluaengineunit,
  disassemblerviewlinesunit,
  frmBreakpointConditionunit,
  frmStringMapUnit,
  frmStringpointerscanUnit,
  frmFilePatcherUnit,
  frmUltimapUnit,
  frmAssemblyScanUnit,
  AccessedMemory,
  Parsers;


resourcestring
  rsUnlinkFromOtherHexview = 'Unlink from other hexview';
  rsLinkWithOtherHexview = 'Link with other hexview';
  rsStopShowingTheDifference = 'Stop showing the difference';
  rsShowDifference = 'Show difference';
  rsBetween = 'Between %s';
  rsHowLongShouldAChangeBeShown = 'How long should a change be shown?';
  rsChangeDisplayFader = 'Change display fader';
  rsGotoAddress = 'Goto Address';
  rsFillInTheAddressYouWantToGoTo = 'Fill in the address you want to go to';
  rsMemoryViewerRunning = 'Memory Viewer - Running';
  rsCheatEngineSingleLingeAssembler = 'Cheat Engine single-line assembler';
  rsTypeYourAssemblerCodeHereAddress = 'Type your assembler code here: (address=%s)';
  rsTheGeneratedCodeIsByteSLongButTheSelectedOpcodeIsB = 'The generated code is %s byte(s) long, but the selected opcode is %s byte(s) long! Do you want to replace the '
    +'incomplete opcode(s) with NOP''s?';
  rsIDonTUnderstandWhatYouMeanWith = 'I don''t understand what you mean with %s';
  rsChangeRegister = 'Change register';
  rsWhatIsTheNewValueOf = 'What is the new value of %s?';
  rs0Or1 = '(0 or 1)';
  rsIsNotAValidValue = '%s is not a valid value';
  rsAllocateMemory = 'Allocate memory';
  rsHowMuchMemoryDoYouWantToAddToThisProcess = 'How much memory do you want to add to this process?';
  rsHowMuchIs = 'How much is %s?';
  rsErrorAllocatingMemory = 'Error allocating memory!';
  rsAtLeastBytesHaveBeenAllocatedAtDoYouWantToGoThereN = 'At least %s bytes have been allocated at %s%sDo you want to go there now?';
  rsCreateRemoteThread = 'Create remote thread';
  rsWhatWillBeTheStartaddressOfThisThread = 'What will be the startaddress of this thread?';
  rsPleaseEnterAValidHexadecimalAddres = 'Please enter a valid hexadecimal addres';
  rsYouWantToGiveAnAdditional32BitParameterWillShowUpI = 'You want to give an additional 32-bit parameter? (Will show up in (R)/(E)BX)';
  rsPleaseEnterAValidHexadecimalValue = 'Please enter a valid hexadecimal value';
  rsPleaseTargetAProcessFirst = 'Please target a process first';
  rsPleaseTargetAnotherProcess = 'Start another version of Cheat Engine and attach to that instead';
  rsDoYouWantToExecuteAFunctionOfTheDll = 'Do you want to execute a function of the dll?';
  rsInjectDll = 'Inject dll';
  rsSelectTheFunctionYouWantToExecute = 'Select the function you want to execute';
  rsDLLInjected = 'DLL Injected';
  rsHowMuchMemoryDoYouWishToAllocate = 'How much memory do you wish to allocate?';
  rsAtLeastBytesHaveBeenAllocatedAtGoThereNow = 'At least %s bytes have been allocated at %s. Go there now?';
  rsGetKernelAddress = 'Get kernel address';
  rsGiveTheNameOfTheFunctionYouWantToFindCaseSensitive = 'Give the name of the function you want to find (Case sensitive,certain words can cause blue screens)';
  rsAssemblyScan = 'Assembly scan';
  rsInputTheAssemblyCodeToFindWilcardsSupported = 'Input the assembly code to find. Wildcards( * ) supported.';
  rsSymbolHandler = 'Symbol handler';
  rsPleaseSpecifyTheNewSymbolSearchpathSeperatesPaths = 'Please specify the new symbol searchpath (; separates paths)';
  rsMemoryBrowser = 'MemoryBrowser';
  rsReturnAddress = 'Return Address';
  rsParameters = 'Parameters';
  rsAddress = 'Address';
  rsValue = 'Value';
  rsStacktrace = 'Stacktrace';
  rsNewSize = 'New size';
  rsMaxStacktraceSize = 'Max stacktrace size';
  rsNeedToRunDissectCode = 'You will need to run the dissect code routine first before this window is usable. Run it now?';
  rsMemoryViewerCurrentlyDebuggingThread = 'Memory Viewer - Currently debugging thread %s';
  rsRestoreWithOrginalCode = 'Restore with original code';
  rsReplaceWithCodeThatDoesNothing = 'Replace with code that does nothing';
  rsComment = 'Comment';
  rsCommentFor = 'Comment for %s';
  rsSShowsTheAutoguessValue = '(%s shows the autoguess value)';


//property functions:
function TMemoryBrowser.getShowValues: boolean;
begin
  result:=FShowValues;
end;

procedure TMemoryBrowser.setShowValues(newstate: boolean);
begin
  Showvaluesofstaticaddresses1.checked:=newstate;
  FShowValues:=newstate;
  if disassemblerview<>nil then
    disassemblerview.setCommentsTab(FShowValues);
end;

procedure TMemoryBrowser.setShowDebugPanels(state: boolean);
begin
  if state then
  begin
    //resizing should change the stack, not the hexview
    panel3.Align:=alLeft;
    splitter3.Align:=alLeft;
    pnlStacktrace.align:=alclient;
    splitter3.ResizeControl:=pnlStacktrace;
  end
  else
  begin
    splitter3.ResizeControl:=panel3;
    pnlStacktrace.align:=alRight;
    splitter3.Align:=alRight;
    panel3.Align:=alclient;
  end;

  FShowDebugPanels:=state;
  registerview.Visible:=state;
  pnlStacktrace.Visible:=state;
  splitter2.Visible:=state;
  splitter3.Visible:=state;


end;

procedure TMemoryBrowser.SetStacktraceSize(size: integer);
var x: ptrUint;
begin
  FStacktraceSize:=size;

  if laststack<>nil then
    freemem(laststack);

  laststack:=getmem(size);
  readprocessmemory(processhandle, pointer(lastdebugcontext.{$ifdef cpu64}rsp{$else}esp{$endif}), laststack, size, x);

  reloadStacktrace;
end;

//^^^^


procedure TMemoryBrowser.WMGetMinMaxInfo(var Message: TMessage);
var MMInfo: ^MINMAXINFO;
begin
  if panel1.visible then
  begin
    MMInfo:=pointer(message.LParam);
    MMInfo.ptMinTrackSize:=point(340,panel1.Height+100);
  end
  else
  begin
    MMInfo:=pointer(message.LParam);
    MMInfo.ptMinTrackSize:=point(340,100);
  end;
end;


procedure TMemoryBrowser.UpdateRWAddress(disasm: string);
var seperator: integer;
    fb: integer;
    nb: integer;
    address: string;
    offset:dword;
begin
  //temporaryily obsolete
  
{  seperator:=pos(',',disasm);
  if seperator>0 then
  begin
    fb:=pos('[',disasm);
    nb:=pos(']',disasm);

    if nb>fb then
    begin
      //if fb<seperator then label1.Font.Color:=clRed //write
      //                else label1.font.color:=clGreen; //read
      address:=copy(disasm,fb+1,nb-fb-1);

      try
        offset:=getaddress(address);
      except

      end;
      //label1.Caption:=IntToHex(offset,8);
    end;
  end; }
end;


procedure TMemoryBrowser.Splitter1Moved(Sender: TObject);
begin
  disassemblerview.Update;
end;

procedure TMemoryBrowser.ScrollBox1Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.ScrollBox1ConstrainedResize(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: TConstraintSize);
begin

end;

procedure TMemoryBrowser.ScrollBox1Paint(Sender: TObject);
begin

end;

procedure TMemoryBrowser.Panel1Resize(Sender: TObject);
begin

end;

procedure TMemoryBrowser.miLockRowsizeClick(Sender: TObject);
begin
  miLockRowsize.Checked:=not miLockRowsize.Checked;

  if miLockRowsize.Checked then
    hexview.LockRowsize
  else
    hexview.UnlockRowsize;
end;

procedure TMemoryBrowser.RegisterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var s: string;
i: integer;
begin
  if button = mbright then
  begin
    if (sender is TLabel) then
    begin
      s:=tlabel(sender).Caption;
      i:=pos(' ',s);
      if i>0 then //should always be true
      begin
        s:=copy(s,i+1,length(s));

        clipboard.AsText:=s;
      end;
    end;
  end;
end;

procedure TMemoryBrowser.miDebugEventsClick(Sender: TObject);
begin
  if frmDebugEvents=nil then
    frmDebugEvents:=tfrmDebugEvents.create(application);

  frmDebugEvents.show;
end;

procedure TMemoryBrowser.miLuaEngineClick(Sender: TObject);
begin
  //start lua engine window
  if frmLuaEngine=nil then
    frmLuaEngine:=TfrmLuaEngine.create(MemoryBrowser); //main mb

  frmLuaEngine.show;

end;

procedure TMemoryBrowser.miPagingClick(Sender: TObject);
begin
  TfrmPaging.create(application).show;
end;

procedure TMemoryBrowser.miUserdefinedCommentClick(Sender: TObject);
var
  s: tstringlist;
begin
  s:=tstringlist.create;
  try
    s.text:=ansitoutf8(dassemblercomments.comments[disassemblerview.SelectedAddress]);
    if multilineinputquery(rsCommentFor, Format(rsCommentFor, [inttohex(disassemblerview.SelectedAddress, 8)])+' '+rsSShowsTheAutoguessValue, s) then
      dassemblercomments.comments[disassemblerview.SelectedAddress]:=utf8toansi(s.text);
  finally
    s.free;
  end;

  disassemblerview.Refresh;
end;

procedure TMemoryBrowser.miUserDefinedHeaderClick(Sender: TObject);
var
  s: tstringlist;
begin
  s:=tstringlist.create;
  try
    s.text:=ansitoutf8(dassemblercomments.commentHeader[disassemblerview.SelectedAddress]);
    if multilineinputquery(rsCommentFor, Format(rsCommentFor, [inttohex(disassemblerview.SelectedAddress, 8)])+' '+rsSShowsTheAutoguessValue, s) then
      dassemblercomments.commentHeader[disassemblerview.SelectedAddress]:=utf8toansi(s.text);
  finally
    s.free;
  end;

  disassemblerview.Refresh;
end;

procedure TMemoryBrowser.Panel5Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.miLockOnClick(Sender: TObject);
begin
  hexview.unlock;
end;

procedure TMemoryBrowser.miLockMemviewClick(sender: TObject);
begin
  hexview.Lock(TMemoryBrowser(MemoryBrowsers[(sender as TMenuItem).tag]).hexview);
end;

procedure TMemoryBrowser.miDifferenceClick(Sender: TObject);
begin
  hexview.ShowDifference(TMemoryBrowser(MemoryBrowsers[(sender as TMenuItem).tag]).hexview);
end;

procedure TMemoryBrowser.miStopDifferenceClick(Sender: TObject);
begin
  hexview.EndDifferenceView;
end;



procedure TMemoryBrowser.memorypopupPopup(Sender: TObject);
var
  m: TMemorybrowser;
  mi: TMenuItem;
  i: integer;

  islocked: boolean;
  a,a2: ptruint;
  hasbp: boolean;
begin
  miShowDifference.clear;
  miLock.Clear;

  islocked:=hexview.isLocked;
  if isLocked then
  begin
    miLock.OnClick:=miLockOnClick;
    miLock.caption:=rsUnlinkFromOtherHexview;
  end
  else
  begin
    miLock.OnClick:=nil;
    miLock.caption:=rsLinkWithOtherHexview;
  end;

  if hexview.isShowingDifference then
  begin
    miShowDifference.caption:=rsStopShowingTheDifference;
    miShowDifference.onclick:=miStopDifferenceClick;
  end
  else
  begin
    miShowDifference.caption:=rsShowDifference;
    miShowDifference.onclick:=nil;
  end;

  miLock.enabled:=MemoryBrowsers.count>1;

  for i:=0 to MemoryBrowsers.count-1 do
  begin
    m:=Memorybrowsers[i];
    if m<>self then
    begin
      if not hexview.isShowingDifference then
      begin
        mi:=TMenuItem.Create(miShowDifference);
        mi.Caption:=Format(rsBetween, [m.Caption]);
        mi.OnClick:=miDifferenceClick;
        mi.tag:=i;
        miShowDifference.Add(mi);
      end;

      if not islocked then
      begin
        mi:=TMenuItem.Create(miLock);
        mi.caption:=m.caption;
        mi.OnClick:=miLockMemviewClick;
        mi.tag:=i;
        miLock.add(mi);
      end;
    end;

  end;


  if (hexview.hasSelection) then
  begin
    hexview.GetSelectionRange(a,a2);

    hasbp:=(debuggerthread<>nil) and (debuggerthread.isBreakpoint(a,a2)<>nil);
    MenuItem4.visible:=(not ischild) and (not hasbp);
    MenuItem6.visible:=not hasbp;
    MenuItem5.visible:=not hasbp;
    MenuItem7.visible:=not hasbp;
    MenuItem8.visible:=not hasbp;
    miDeleteBP.visible:=hasbp;
  end
  else
  begin
    MenuItem4.visible:=false;
    MenuItem6.visible:=false;
    MenuItem5.visible:=false;
    MenuItem7.visible:=false;
    MenuItem8.visible:=false;
    miDeleteBP.visible:=false;
  end;
end;

procedure TMemoryBrowser.MenuItem10Click(Sender: TObject);
begin
  if frmStringMap=nil then
    frmStringMap:=TfrmStringMap.Create(application);

  frmStringMap.show;
end;

procedure TMemoryBrowser.MenuItem11Click(Sender: TObject);
begin
  if frmStringPointerscan=nil then
    frmStringpointerscan:=Tfrmstringpointerscan.create(MemoryBrowser);

  frmStringpointerscan.rbStringscan.Checked:=true;
  frmStringpointerscan.edtBase.text:=inttohex(hexview.address,8);

  frmStringpointerscan.show;
end;

procedure TMemoryBrowser.MenuItem12Click(Sender: TObject);
var f: Tfrmfilepatcher;
begin
  f:=tfrmfilepatcher.create(self);
  f.showmodal;
  f.free;
end;

procedure TMemoryBrowser.MenuItem14Click(Sender: TObject);
begin
  if frmUltimap=nil then
    frmUltimap:=TfrmUltimap.create(application);

  frmUltimap.show;
end;

procedure TMemoryBrowser.MenuItem17Click(Sender: TObject);
begin
  //build a structure using a registered template and the current data stream
end;

procedure TMemoryBrowser.MenuItem18Click(Sender: TObject);
begin
  TfrmMemoryViewEx.create(self).show;
end;

procedure TMemoryBrowser.MenuItem20Click(Sender: TObject);
var t: Tfrmtracer;
begin
  t:=TFrmTracer.create(self,false,true);

  try
    t.miLoad.Click;
  except
    on e: exception do
    begin
      t.free; //not needed anymore
      messagedlg(e.Message, mterror, [mbok],0);
      exit;
    end;
  end;

  t.show;

end;

procedure TMemoryBrowser.MenuItem22Click(Sender: TObject);
begin
  if frmAccessedMemory=nil then
    frmAccessedMemory:=TfrmAccessedMemory.Create(application);

  frmAccessedMemory.Show;
end;

procedure TMemoryBrowser.miTextEncodingClick(Sender: TObject);
begin
  if miTextEncoding8.checked then
    hexview.CharEncoding:=ceUtf8
  else
    hexview.CharEncoding:=ceUtf16;
end;




procedure TMemoryBrowser.miCopyBytesOnlyClick(Sender: TObject);
var start, stop: ptruint;
   l,i: integer;
   x: string;
   x2: ptrUint;
   buf: pbytearray;

   result: string;
begin
  //Unrelated to the copy bytes. This indicates the user just wants and AOB
  start:=minX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);
  stop:=maxX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);

  //adjust stop to go AFTER the instruction
  disassemble(stop, x);

  l:=stop-start;

  if l<65535 then //not going to do more than that
  begin
    getmem(buf, l);
    try
      if readprocessmemory(processhandle, pointer(start), buf, l, x2) then
      begin
        result:='';
        for i:=0 to l-1 do
          result:=result+inttohex(buf[i],2)+' ';

        Clipboard.AsText:=copy(result,1,length(result)-1);
      end;
    finally
      freemem(buf);
    end;
  end;
end;

procedure TMemoryBrowser.miDissectData2Click(Sender: TObject);
begin
  if frmStructures2.count>0 then
  begin
   // TfrmStructures2(frmStructures2[0]).edtAddress.Text:=inttohex(memorybrowser.memoryaddress,8);
    TfrmStructures2(frmStructures2[0]).show;
  end
  else
  begin
    //create it
    with tfrmstructures2.create(application) do
    begin
      initialaddress:=memoryaddress;
      show;
    end;
  end;
end;

procedure TMemoryBrowser.miPointerSpiderClick(Sender: TObject);
begin
  if frmStringPointerscan=nil then
    frmStringpointerscan:=Tfrmstringpointerscan.create(application);

  frmStringpointerscan.rbDatascan.Checked:=true;
  frmStringpointerscan.edtBase.text:=inttohex(hexview.address,8);

  frmStringpointerscan.show;
end;

procedure TMemoryBrowser.MenuItem2Click(Sender: TObject);
var start,stop: ptrUint;
  pa, a: ptruint;

  d: TDisassembler;
  s: string;
  infloop: integer;
begin
  backlist.Push(pointer(disassemblerview.SelectedAddress));

  //disassemble the code and find the last address
//  parametervaluetype:=dvtaddress;
  d:=TDisassembler.create;
  try
    start:=disassemblerview.SelectedAddress;




    //find stop:
    stop:=start;
    a:=stop;

    infloop:=0;
    while infloop<100000 do
    begin
      inc(infloop);

      pa:=a;
      d.disassemble(a,s);

      if (length(d.LastDisassembleData.Bytes)>=2) and (d.LastDisassembleData.Bytes[0]=0) and (d.LastDisassembleData.Bytes[1]=0) then
      begin
        stop:=pa;
        break;
      end;


      if (d.LastDisassembleData.opcode='??') or (d.LastDisassembleData.opcode='ret') or (d.LastDisassembleData.opcode='int 3') or (d.LastDisassembleData.opcode='nop') then //found the end
      begin
        stop:=pa;
        break;
      end;

      if (d.LastDisassembleData.isjump) and (not d.LastDisassembleData.iscall) then
      begin
        //adjust the current address to point
        if d.LastDisassembleData.parameterValueType=dvtAddress then //direct address
        begin
          if isAddress(d.LastDisassembleData.parameterValue) then
          begin
            if d.LastDisassembleData.parameterValue < start then
            begin
              start:=d.LastDisassembleData.parameterValue;
              continue;
            end;

            if d.LastDisassembleData.parameterValue > pa then
            begin
              stop:=d.LastDisassembleData.parameterValue;
              a:=stop;
              continue;
            end;

            if (d.LastDisassembleData.parameterValue <= a) and (d.LastDisassembleData.opcode='jmp') then //an unconditonal jump that jumps back and no conditonal jump encountered that went after this. Meaning: Infinite loop
            begin
              stop:=pa;
              break;
            end;
          end;


        end;
      end;

    end;


    //find start
    infloop:=0;

    pa:=start;
    d.disassemble(pa,s); //start from next one in case it's started from the begin

    while infloop<100000 do
    begin
      inc(infloop);


      a:=previousopcode(pa);
      pa:=a;
      d.disassemble(a,s);

      //look for 00 , 00  (add [eax],al is an 100% completely useless instruction)
      if (length(d.LastDisassembleData.Bytes)>=2) and (d.LastDisassembleData.Bytes[0]=0) and (d.LastDisassembleData.Bytes[1]=0) then
      begin
        start:=a;
        break;
      end;


      //look for ret, int3 or nop
      if (d.LastDisassembleData.opcode='??') or (d.LastDisassembleData.opcode='ret') or (d.LastDisassembleData.opcode='int 3') or (d.LastDisassembleData.opcode='nop') then
      begin
        start:=a; //start from next instruction
        break;
      end;

      if processhandler.is64Bit then
      begin
        //looks for sub rsp,xxxx on an address that is dividable by 0x10

        if (pa mod $10 = 0) and (d.LastDisassembleData.opcode='sub') then
        begin
          if pos('rsp,', lowercase(d.LastDisassembleData.parameters))>0 then
          begin
            start:=pa;
            break;
          end;
        end;
      end
      else
      begin
        //look for push ebp
        if (d.LastDisassembleData.opcode='push') then
        begin
          if lowercase(d.LastDisassembleData.parameters)='ebp' then
          begin
            start:=pa;
            break;
          end;
        end;
      end;

    end;

  finally
    d.free;
  end;

  disassemblerview.SelectedAddress:=start;
  disassemblerview.SelectedAddress2:=stop;
end;

procedure TMemoryBrowser.MenuItem4Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.MenuItem5Click(Sender: TObject);
var
  a,a2: ptruint;
begin
  try
    if (startdebuggerifneeded(true)) and (hexview.hasSelection) then
    begin
      hexview.GetSelectionRange(a,a2);
      DebuggerThread.SetOnAccessBreakpoint(a, 1+(a2-a));
      hexview.Update;
    end;
  except
    on e: exception do
      messagedlg(e.message, mtError, [mbOK], 0);
  end;

end;

procedure TMemoryBrowser.MenuItem6Click(Sender: TObject);
var
  a,a2: ptruint;
begin
  try
    if (startdebuggerifneeded(true)) and (hexview.hasSelection) then
    begin
      hexview.GetSelectionRange(a,a2);
      DebuggerThread.SetOnWriteBreakpoint(a, 1+(a2-a));
      hexview.Update;
    end;
  except
    on e: exception do
      messagedlg(e.message, mtError, [mbOK], 0);
  end;


end;

procedure TMemoryBrowser.MenuItem8Click(Sender: TObject);
begin
  TFrmTracer.create(self,true).show;
end;

procedure TMemoryBrowser.MenuItem9Click(Sender: TObject);
var stime: string;
begin
  stime:=inttostr(hexview.fadetimer);
  if InputQuery(rsHowLongShouldAChangeBeShown, rsChangeDisplayFader, stime) then
    hexview.fadeTimer:=strtoint(stime);
end;

procedure TMemoryBrowser.miAddESPClick(Sender: TObject);
begin
  reloadStacktrace;
end;



procedure TMemoryBrowser.miConditionalBreakClick(Sender: TObject);
var
  script: string;
  easy: boolean;
  bp: PBreakpoint;
begin
  bp:=debuggerthread.isBreakpoint(disassemblerview.SelectedAddress);
  if bp<>nil then
  begin
    inc(bp.referencecount);
    try
      with TfrmBreakpointCondition.create(self) do
      begin
        script:=debuggerthread.getbreakpointcondition(bp, easy);

        if script='' then
        begin
          script:=lastBreakpointCondition.script;
          easy:=lastBreakpointCondition.easy;

          if script='' then
            easy:=true;
        end;

        if easy then
          edtEasy.text:=script
        else
          mComplex.text:=script;



        rbEasy.Checked:=easy;
        rbComplex.checked:=not easy;

        if showmodal=mrok then
        begin
          easy:=rbEasy.checked;
          if easy then
            script:=edtEasy.text
          else
            script:=mComplex.text;

          lastBreakpointCondition.script:=script;
          lastBreakpointCondition.easy:=easy;

          debuggerthread.setbreakpointcondition(bp, easy, script);
        end;

        free;
      end;

    finally
      dec(bp.referencecount);
    end;

  end;
end;

procedure TMemoryBrowser.miDeleteBPClick(Sender: TObject);
var bp: PBreakpoint;
  a,a2: ptruint;
begin
  if (debuggerthread<>nil) then
  begin
    hexview.GetSelectionRange(a,a2);

    debuggerthread.lockbplist;
    try
      repeat
        bp:=debuggerthread.isBreakpoint(a,a2);
        if bp<>nil then
          debuggerthread.RemoveBreakpoint(bp);
      until bp=nil;

    finally
      debuggerthread.unlockbplist;
    end;
    hexview.update;
  end;
end;

procedure TMemoryBrowser.miDisassemblyAutodetectClick(Sender: TObject);
begin
  if miDisassemblyAutodetect.checked then
    visibleDisassembler.is64bitOverride:=false
  else
  if miDisassembly32.checked then
  begin
    visibleDisassembler.is64bitOverride:=true;
    visibleDisassembler.is64bitOverridestate:=false
  end
  else
  begin
    visibleDisassembler.is64bitOverride:=true;
    visibleDisassembler.is64bitOverridestate:=true;
  end;

  defaultDisassembler.is64bitOverride:=visibleDisassembler.is64bitoverride;
  defaultDisassembler.is64bitOverridestate:=visibleDisassembler.is64bitOverridestate;

  disassemblerview.update;

end;

procedure TMemoryBrowser.miFindWhatAccessesClick(Sender: TObject);
var
  a,a2: ptruint;
begin
  if (startdebuggerifneeded(true)) and (hexview.hasSelection) then
  begin
    hexview.GetSelectionRange(a,a2);

    DebuggerThread.FindWhatAccesses(a,1+(a2-a));
    hexview.Update;
  end;
end;

procedure TMemoryBrowser.miFindWhatWritesClick(Sender: TObject);
var
  a,a2: ptruint;
begin
  if (startdebuggerifneeded(true)) and (hexview.hasSelection) then
  begin
    hexview.GetSelectionRange(a,a2);

    DebuggerThread.FindWhatWrites(a,1+(a2-a));
    hexview.Update;
  end;

end;

procedure TMemoryBrowser.miSepClick(Sender: TObject);
begin
  hexview.bytesPerSeperator:=TMenuItem(sender).Tag;
end;

procedure TMemoryBrowser.miShowInHexviewClick(Sender: TObject);
begin
  hexview.address:=getContextValueByTag(pmRegisters.PopupComponent.Tag);
end;

procedure TMemoryBrowser.miTextPreferencesClick(Sender: TObject);
var
  x: TfrmMemviewPreferences;
  i: TDisassemblerViewColorsState;
  reg: tregistry;
begin
  with TfrmMemviewPreferences.create(self) do
  begin

    fontdialog1.Font.name:=disassemblerview.Font.name;
    fontdialog1.Font.size:=disassemblerview.Font.size;

    btnFont.Caption:=fontdialog1.Font.Name+' '+inttostr(fontdialog1.Font.Size);

    //set the current colors
    colors:=disassemblerview.colors;

    //and now apply those colors
    cbColorGroupChange(cbColorGroup);

    FontDialog2.Font.Assign(hexview.HexFont);

    if showmodal=mrok then
    begin
      //set the colors and save to registry
      disassemblerview.Font.Name:=fontdialog1.Font.name;
      disassemblerview.Font.size:=fontdialog1.Font.size;
      disassemblerview.colors:=colors;

      hexview.HexFont:=fontdialog2.Font;
    end;
    free;
  end;

  disassemblerview.reinitialize;

  //save to the registry
  reg:=Tregistry.Create;
  try
    if reg.OpenKey('\Software\Cheat Engine\Disassemblerview\',true) then
    begin
      reg.WriteBinaryData('colors', disassemblerview.colors, sizeof(disassemblerview.colors));
      reg.WriteString('font.name', disassemblerview.font.name);
      reg.WriteInteger('font.size', disassemblerview.font.size);
    end;

    if reg.OpenKey('\Software\Cheat Engine\Hexview\',true) then
    begin
      reg.WriteString('font.name', hexview.hexfont.name);
      reg.WriteInteger('font.size', hexview.hexfont.size);
    end;

  finally
    reg.free;
  end;
end;

procedure TMemoryBrowser.FormShow(Sender: TObject);
var x: array of integer;

begin
  if disassemblerview<>nil then
    disassemblerview.Update;


  Sericedescriptortable1.visible:=not Is64bitOS;
  GDTlist1.Visible:=not is64bitos;
  IDTlist1.Visible:=not is64bitos;

end;

procedure TMemoryBrowser.disassemblerviewDblClick(Sender: TObject);
var m: TPoint;
  a: ptruint;
begin
  //find what column is clicked

  m:=disassemblerview.ScreenToClient(mouse.cursorpos);

  a:=disassemblerview.getReferencedByLineAtPos(m);
  if a<>0 then
  begin
    backlist.Push(pointer(disassemblerview.SelectedAddress));
    disassemblerview.SelectedAddress:=a;
  end
  else
  begin
    if m.x>(disassemblerview.getheaderWidth(0)+disassemblerview.getheaderWidth(1)+disassemblerview.getheaderWidth(2)) then
      miUserdefinedComment.click //comment click
    else
      assemble1.Click;
  end;
end;

procedure TMemoryBrowser.FormCreate(Sender: TObject);
var x: array of integer;
  reg: tregistry;
begin
  MemoryBrowsers.Add(self);

  displaytype:=dtByte;

  strace:=tstringlist.create;

  disassembler:=true;

  disassemblerview:=TDisassemblerview.Create(self);
  disassemblerview.Align:=alClient;
  disassemblerview.Parent:=panel5;
  disassemblerview.PopupMenu:=debuggerpopup;
  disassemblerview.OnKeyDown:=FControl1keydown;
  disassemblerview.OnDblClick:=disassemblerviewDblClick;
  disassemblerview.TopAddress:=$00400000;
  disassemblerview.name:='DisassemblerView';

  hexview:=THexview.create(self);
  hexview.Align:=alClient;
  hexview.parent:=panel3;
  hexview.popupmenu:=memorypopup;

  hexview.OnKeyDown:=hexviewKeyDown;
  hexview.Name:='HexadecimalView';

  //load from the registry
  reg:=Tregistry.Create;
  try
    if reg.OpenKey('\Software\Cheat Engine\Disassemblerview\',false) then
    begin
      if reg.ValueExists('colors') then
        reg.ReadBinaryData('colors', disassemblerview.colors, sizeof(disassemblerview.colors));

      if reg.ValueExists('font.name') then
        disassemblerview.font.name:=reg.ReadString('font.name');

      if reg.ValueExists('font.size') then
        disassemblerview.font.size:=reg.ReadInteger('font.size');

      disassemblerview.reinitialize;
    end;

    if reg.OpenKey('\Software\Cheat Engine\Hexview\',false) then
    begin
      if reg.ValueExists('font.name') then
        hexview.hexfont.name:=reg.ReadString('font.name');

      if reg.ValueExists('font.size') then
        hexview.hexfont.size:=reg.ReadInteger('font.size');
    end;

  finally
    reg.free;
  end;








  memoryaddress:=$00400000;
  memorylabelcount:=0;

  Highlightcolor:=clHighlight;

  disassemblerHistory:=TStringList.create;
  memorybrowserHistory:=TStringList.create;
  assemblerHistory:=TStringList.create;

  backlist:=TStack.create;

  showvalues:=true;
  sbShowFloats.left:=scrollbox1.Clientwidth-sbShowFloats.width;

  FStacktraceSize:=4096;
  

  setlength(x, 0);

  if loadformposition(self,x) then
  begin
    disassemblerview.setheaderWidth(0,x[0]);
    disassemblerview.setheaderWidth(1,x[1]);
    disassemblerview.setheaderWidth(2,x[2]);
    disassemblerview.setheaderWidth(3,x[3]);

    if length(x)>4 then
    begin
      panel1.height:=x[4];
      registerview.width:=x[5];
    end;

    if length(x)>6 then
    begin
      Showsymbols1.checked:=x[6]=1;
      Showmoduleaddresses1.checked:=x[7]=1;

      symhandler.showsymbols:=showsymbols1.Checked;
      symhandler.showmodules:=Showmoduleaddresses1.Checked;
    end;


    setlength(x,0);
    posloadedfromreg:=true;
  end;


  scrollbox1.OnVScroll:=Scrollboxscroll;


end;

procedure TMemoryBrowser.Scrollboxscroll(sender: TObject);
begin
  sbShowFloats.Top:=max(oflabel.top+oflabel.height+2 , scrollbox1.vertscrollbar.Position+(registerview.ClientHeight div 2)-sbShowFloats.Height div 2);
end;

procedure TMemoryBrowser.Goto1Click(Sender: TObject);
var newaddress: string;
    canceled: boolean;
    old: ptruint;
begin
  panel4.setfocus;
  old:=memoryaddress;
  newaddress:=inputboxtop(rsGotoAddress, rsFillInTheAddressYouWantToGoTo, IntTohex(memoryaddress, 8), true, canceled, memorybrowserHistory);

  hexview.address:=getaddress(newaddress);

  if old<>hexview.address then
    hexview.history.Push(pointer(old));

  hexview.SetFocus;
end;

procedure TMemoryBrowser.FormResize(Sender: TObject);
begin

  if disassemblerview<>nil then
    disassemblerview.Update;

end;

procedure TMemoryBrowser.Splitter2Moved(Sender: TObject);
begin
  //caption:=inttostr(registerview.width);
end;

procedure TMemoryBrowser.Timer2Timer(Sender: TObject);
var
  rollover: integer;
begin
  if Visible then
  begin
    if hexview<>nil then hexview.update;
    if disassemblerview<>nil then disassemblerview.Update;

    //refresh the modulelist
    if processhandler.isNetwork then
      rollover:=250
    else
      rollover:=50;

    lastmodulelistupdate:=(lastmodulelistupdate+1) mod rollover;
    if lastmodulelistupdate=0 then
      if symhandler<>nil then symhandler.loadmodulelist;
  end;
end;

procedure TMemoryBrowser.miReplacewithnopsClick(Sender: TObject);
var codelength: dword;
    written: dword;
    bla:string;
    i,j: integer;
    nops: array of byte;
    a: ptrUint;
    original: dword;

    mbi : _MEMORY_BASIC_INFORMATION;
  //set the protectionlabel
begin
  a:=disassemblerview.SelectedAddress;

  for i:=0 to AdvancedOptions.numberofcodes-1 do
  begin
    if InRangeX(disassemblerview.SelectedAddress, AdvancedOptions.code[i].Address, AdvancedOptions.code[i].Address+length(AdvancedOptions.code[i].actualopcode)-1 ) then
    begin
      for j:=0 to AdvancedOptions.Codelist2.Items.count-1 do
        AdvancedOptions.Codelist2.Items[j].Selected:=false;

      AdvancedOptions.Codelist2.Items[i].Selected:=true;
      AdvancedOptions.Codelist2.ItemIndex:=i;

      if AdvancedOptions.code[i].changed then
        AdvancedOptions.miRestoreWithOriginal.OnClick(AdvancedOptions.miRestoreWithOriginal)
      else
        AdvancedOptions.miReplaceWithNops.onclick(AdvancedOptions.miReplaceWithNops);

      exit;
    end;
  end;

  //still here so add it to the codelist

  disassemble(a,bla);
  codelength:=a-disassemblerview.SelectedAddress;

  if advancedoptions.AddToCodeList(disassemblerview.SelectedAddress,codelength,true) then
  begin
    setlength(nops,codelength);
    for i:=0 to codelength-1 do
      nops[i]:=$90;  // $90=nop

    zeromemory(@mbi,sizeof(mbi));
    Virtualqueryex(processhandle,pointer(disassemblerview.SelectedAddress),mbi,sizeof(mbi));

   // get old security and set new security   (not needed in win9x but nt doesnt even allow writeprocessmemory to do this
    original:=0;

    RewriteCode(processhandle,disassemblerview.SelectedAddress,@nops[0],codelength);
    hexview.update;
    disassemblerview.Update;;
  end;
end;

procedure TMemoryBrowser.hexviewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if shift=[ssCtrl] then
  begin
    case key of
      vk_space: //ctrl+space
      begin
        disassemblerview.SelectedAddress:=memoryaddress;
        key:=0;
      end;

      ord('G'):
      begin
        goto1.click;    //ctrl+g
        key:=0;
      end;

      ord('C'):
      begin
        Cut1.OnClick(Cut1); //ctrl+c
        key:=0;
      end;

      ord('V'):
      begin
        Pastefromclipboard1.OnClick(Pastefromclipboard1); //ctrl+v
        key:=0;
      end;

      ord('F'):
      begin
        search1.OnClick(self);
      end;
    end;
  end
  else
  if shift=[] then
  begin
    if key=vk_f3 then
    begin
      if findwindow<>nil then //easy way to find out if there was a scan before
      begin
        findwindow.editStart.Text:=inttohex(memoryaddress+1,8);
        findwindow.firstscan:=false;
        findwindow.btnOK.Click;
      end else
      begin
        search1.OnClick(self);
      end;
    end;

  end;
end;

//key control for the disassembler
procedure TMemoryBrowser.FControl1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var rct: trect;
    ignore: string;
    i: integer;

    a,b: ptrUint;
begin
  //if shift is not pressed and it's a up,down,left or right, then disable multiline section
  case key of
    vk_delete:
      miReplacewithnops.Click;


    vk_return:
    begin
      //assembler input
      if shift = [] then
        assemble1.Click;
    end;

    vk_space:
    begin
      if shift=[] then
        follow1.Click
      else
      if shift = [ssShift] then
        back1.click
      else
      if shift = [ssCtrl] then
        memoryaddress:=disassemblerview.SelectedAddress;
    end;

    VK_BACK:
    begin
      back1.click; //backspace and shift+space
    end;

    ORD('A')..ORD('Z') , ORD('0')..ORD('9'):
    begin
      if key=ORD('C') then
      begin
        if shift = [ssCtrl] then //ctrl C
        begin

          //open the copy window asking what exactly to copy
          with tfrmSavedisassembly.create(self) do
          begin
            a:=minX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);
            b:=maxX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);

            
            disassemble(b); //b gets increased with size of selected instruction
            edit1.Text:=inttohex(a,8);
            edit2.Text:=inttohex(b-1,8);
            copymode:=true;
            showmodal;
            free;
            exit;
          end;

        end;
      end;

      if key=ORD('G') then
      begin
        if ssCtrl in shift then
        begin
          gotoaddress1.Click;
          disassemblerview.Update;
          exit;
        end;
      end;

      if (ssalt in shift) or (ssctrl in shift) then exit; 

      assemblepopup(lowercase(chr(key)));
    end;
  end;

  disassemblerview.Update;

  //key:=0;
end;

procedure TMemoryBrowser.FControl1KeyPress(Sender: TObject; var Key: Char);
begin
  //key:=chr(0);
end;

procedure TMemoryBrowser.Gotoaddress1Click(Sender: TObject);
var newaddress: string;
    symbol :PImagehlpSymbol;
    oldoptions: dword;
    canceled: boolean;
    oldAddress: ptrUint;
begin
  newaddress:=InputBoxTop(rsGotoAddress, rsFillInTheAddressYouWantToGoTo, IntTohex(disassemblerview.SelectedAddress, 8), true, canceled, memorybrowserHistory);

  oldAddress:=disassemblerview.SelectedAddress;
  try
    disassemblerview.SelectedAddress:=symhandler.getaddressfromname(newaddress);
  except
    disassemblerview.SelectedAddress:=getaddress(newaddress);
  end;

  backlist.Push(pointer(oldAddress));
end;

procedure TMemoryBrowser.Search1Click(Sender: TObject);
begin

  if findwindow=nil then findwindow:=TFindwindow.create(self);
  findwindow.firstscan:=true;
  findwindow.ShowModal;
end;

procedure TMemoryBrowser.Change1Click(Sender: TObject);
begin
  hexview.changeSelected;
end;

procedure TMemoryBrowser.Addthisaddresstothelist1Click(Sender: TObject);
var i: integer;
    ad: ptrUint;
begin
//this will add the selected recdord to the list
  hexview.AddSelectedAddressToCheatTable;


end;

procedure TMemoryBrowser.miAddToTheCodelistClick(Sender: TObject);
var {start,stop: string;
    a,b: dword;
    i: integer;}
    desc: string;

begin

  frmAddToCodeList:=TfrmAddToCodeList.create(self);
  frmAddToCodeList.addtocodelist:=true;
  frmAddToCodeList.fromaddress:=disassemblerview.SelectedAddress;
  frmAddToCodeList.toaddress:=disassemblerview.SelectedAddress;
  disassemble(frmAddToCodeList.toaddress,desc);
  dec(frmAddToCodeList.toaddress);
  frmAddToCodeList.showmodal;
end;

procedure TMemoryBrowser.Splitter1CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin

  if newsize<80 then
  begin
    newsize:=80;
    accept:=false;
  end;

  if newsize>memorybrowser.Height-80 then
  begin
    newsize:=memorybrowser.Height-80;
    accept:=false;
  end;
  accept:=true;


end;

procedure TMemoryBrowser.ScrollBar2Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin

end;

procedure TMemoryBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ischild then
  begin
    //do stuff particulary for the children
    action:=cafree;
  end
  else
  begin
    //do stuff for the main debugger
    if (debuggerthread<>nil) and (run1.enabled) then run1.click; //run if it was paused


    if frmFloatingPointPanel<>nil then
      frmFloatingPointPanel.Visible:=false;

  end;
end;

procedure TMemoryBrowser.Run1Click(Sender: TObject);
begin
  begin
    if debuggerthread<>nil then
      debuggerthread.ContinueDebugging(co_run);


    caption:=rsMemoryViewerRunning;


    reloadstacktrace;
  end;
end;

procedure TMemoryBrowser.Step1Click(Sender: TObject);
begin
  begin
    if debuggerthread<>nil then
      debuggerthread.ContinueDebugging(co_stepinto);

    caption:=rsMemoryViewerRunning;

    reloadstacktrace;
  end;
end;

procedure TMemoryBrowser.StepOver1Click(Sender: TObject);
var x: ptrUint;
    i,j: integer;
    s,s1,s2,temp:string;
    int3: byte;
    original,a,written:dword;
begin
  debuggerthread.continueDebugging(co_stepover);
  reloadstacktrace;
  caption:=rsMemoryViewerRunning;
end;

procedure TMemoryBrowser.Runtill1Click(Sender: TObject);
var x: ptrUint;
    i: integer;
    temp:string;
    int3: byte;
    original,a,written:dword;
begin
  begin
    if debuggerthread<>nil then
      debuggerthread.ContinueDebugging(co_runtill, disassemblerview.SelectedAddress);

    caption:=rsMemoryViewerRunning;
  end;

end;

procedure TMemoryBrowser.Stacktrace1Click(Sender: TObject);
begin
  if frmstacktrace=nil then
    frmstacktrace:=tfrmstacktrace.create(application);

  frmstacktrace.Show;
end;

procedure TMemoryBrowser.Threadlist1Click(Sender: TObject);
begin

  if frmThreadlist=nil then
    frmThreadlist:=tfrmthreadlist.create(self);

  frmThreadlist.show;
end;

procedure TMemoryBrowser.AssemblePopup(x:string);
var assemblercode,desc: string;
    bytes: tassemblerbytes;
    a,b,original,written:ptrUint;
    originalsize:ptrUint;
    replace: boolean;
    c: word;

    res: word;
    i: integer;
    canceled: boolean;

    localdisassembler: TDisassembler;
    bytelength: dword;
begin

  //make sure it doesnt have a breakpoint
  if debuggerthread<>nil then
  begin
    if debuggerthread.isBreakpoint(disassemblerview.SelectedAddress)<>nil then
    begin
      beep; //Best sound effect cheat engine has
      exit;
    end;
  end;


  originalsize:=disassemblerview.SelectedAddress;

  localdisassembler:=TDisassembler.Create;
  try
    localdisassembler.disassemble(originalsize,desc);
    assemblercode:=localdisassembler.LastDisassembleData.prefix+localdisassembler.LastDisassembleData.opcode+' '+localdisassembler.LastDisassembleData.parameters;
  finally
    localdisassembler.free;
  end;

  dec(originalsize,disassemblerview.SelectedAddress);


  if x<>'' then assemblercode:=x;


//  copy

  assemblercode:=InputboxTop(rsCheatEngineSingleLingeAssembler, Format(rsTypeYourAssemblerCodeHereAddress, [inttohex(disassemblerview.SelectedAddress, 8)]), assemblercode, x='', canceled, assemblerHistory);
  if not canceled then
  begin

    try
      if Assemble(assemblercode,disassemblerview.SelectedAddress,bytes) then
      begin
        if originalsize<>length(bytes) then
        begin
          if formsettings.replacewithnops.checked then
          begin
            if formsettings.askforreplacewithnops.checked then
            begin
              c:=messagedlg(Format(rsTheGeneratedCodeIsByteSLongButTheSelectedOpcodeIsB, [IntToStr(length(bytes)), IntToStr(originalsize)]), mtConfirmation, mbYesNoCancel, 0);
              replace:=c=mryes;
              if c=mrCancel then exit;
            end else replace:=true;

            if replace then
            begin
              while originalsize>length(bytes) do
              begin
                setlength(bytes,length(bytes)+1);
                bytes[length(bytes)-1]:=$90;
              end;

              a:=disassemblerview.SelectedAddress+length(bytes);

              b:=disassemblerview.SelectedAddress;
              while b<a do disassemble(b,desc);

              a:=b-disassemblerview.SelectedAddress;
              while length(bytes)<a do
              begin
                setlength(bytes,length(bytes)+1);
                bytes[length(bytes)-1]:=$90;
              end;
            end;


          end;
        end;

        //note to self, check the size of the current opcode and give the option to replace the missing or too many bytes with nops
        //and put in a option to disable showing that message, and use a default action

        // get old security and set new security   (not needed in win9x but nt doesnt even allow writeprocessmemory to do this
        original:=0;

        bytelength:=length(bytes);
        RewriteCode(processhandle,disassemblerview.SelectedAddress,@bytes[0],bytelength);
        hexview.update;
        disassemblerview.Update;
      end else raise exception.create(Format(rsIDonTUnderstandWhatYouMeanWith, [assemblercode]));
    except
      raise exception.create(Format(rsIDonTUnderstandWhatYouMeanWith, [assemblercode]));
    end;

  end;
end;

procedure TMemoryBrowser.Assemble1Click(Sender: TObject);
begin
  AssemblePopup('');
end;

procedure TMemoryBrowser.HexEditKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    chr(8)   : ;
    chr(16)  : ;
    'A'..'F' : ;
    'a'..'f' : key:=uppercase(key)[1];
    '0'..'9' : ;
    else key:=chr(0);
  end;

  if editing then key:=#0;
  editing:=false;
end;

procedure TMemoryBrowser.HexEditExit(Sender: TObject);
begin

end;

procedure TMemoryBrowser.HexEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
end;

procedure TMemoryBrowser.miShowIndisassemblerClick(Sender: TObject);
begin
  disassemblerview.SelectedAddress:=getContextValueByTag(pmRegisters.PopupComponent.Tag);
end;

function TMemoryBrowser.getContextValueByTag(tag: integer): ptruint;
var context: PCONTEXT;
begin
  result:=0;
  if (debuggerthread<>nil) and (debuggerthread.CurrentThread<>nil) then
  begin
    context:=debuggerthread.CurrentThread.context;
    case Tag of
      0: result:=context.{$ifdef cpu64}Rax{$else}Eax{$endif};    //eax
      1: result:=context.{$ifdef cpu64}Rbx{$else}Ebx{$endif};    //ebx
      2: result:=context.{$ifdef cpu64}Rcx{$else}Ecx{$endif};    //ecx
      3: result:=context.{$ifdef cpu64}Rdx{$else}Edx{$endif};    //edx
      4: result:=context.{$ifdef cpu64}Rsi{$else}Esi{$endif};    //esi
      5: result:=context.{$ifdef cpu64}Rdi{$else}Edi{$endif};    //edi
      6: result:=context.{$ifdef cpu64}Rbp{$else}Ebp{$endif};    //ebp
      7: result:=context.{$ifdef cpu64}Rsp{$else}Esp{$endif};    //esp
      8: result:=context.{$ifdef cpu64}Rip{$else}Eip{$endif};    //eip
      9: result:=context.segcs;    //cs
      10: result:=context.segss;    //ss
      11: result:=context.segds;    //ds
      12: result:=context.seges;    //es
      13: result:=context.segfs;    //fs
      14: result:=context.seggs;    //gs

      20: result:=getbit(0,context.eflags); //0=cf
      21: result:=getbit(2,context.eflags); //2=pf
      22: result:=getbit(4,context.eflags); //4=af
      23: result:=getbit(6,context.eflags); //6=zf
      24: result:=getbit(7,context.eflags); //7=sf
      25: result:=getbit(10,context.eflags); //10=df
      26: result:=getbit(11,context.eflags); //11=of

      {$ifdef cpu64}
      6408: result:=context.r8;
      6409: result:=context.r9;
      6410: result:=context.r10;
      6411: result:=context.r11;
      6412: result:=context.r12;
      6413: result:=context.r13;
      6414: result:=context.r14;
      6415: result:=context.r15;
      {$endif}
    end;

  end;
end;

procedure TMemoryBrowser.setContextValueByTag(value: ptruint; tag: integer);
var context: PCONTEXT;
    EIPWasFocused: boolean;
begin

  if (debuggerthread<>nil) and (debuggerthread.CurrentThread<>nil) then
  begin
    eipwasfocused:=disassemblerview.SelectedAddress=debuggerthread.CurrentThread.context.{$ifdef cpu32}EIP{$else}Rip{$endif};


    context:=debuggerthread.CurrentThread.context;
    case tag of
      0: context.{$ifdef cpu64}Rax{$else}Eax{$endif}:=value;    //eax
      1: context.{$ifdef cpu64}Rbx{$else}Ebx{$endif}:=value;    //ebx
      2: context.{$ifdef cpu64}Rcx{$else}Ecx{$endif}:=value;    //ecx
      3: context.{$ifdef cpu64}Rdx{$else}Edx{$endif}:=value;    //edx
      4: context.{$ifdef cpu64}Rsi{$else}Esi{$endif}:=value;    //esi
      5: context.{$ifdef cpu64}Rdi{$else}Edi{$endif}:=value;    //edi
      6: context.{$ifdef cpu64}Rbp{$else}Ebp{$endif}:=value;    //ebp
      7: context.{$ifdef cpu64}Rsp{$else}Esp{$endif}:=value;    //esp
      8:
      begin
        context.{$ifdef cpu64}Rip{$else}Eip{$endif}:=value;    //eip
        if EIPWasFocused then
          disassemblerview.SelectedAddress:=value;
      end;

      9: context.segcs:=value;    //cs
      10: context.segss:=value;    //ss
      11: context.segds:=value;    //ds
      12: context.seges:=value;    //es
      13: context.segfs:=value;    //fs
      14: context.seggs:=value;    //gs

      20: setbit(0,context.eflags,value); //0=cf
      21: setbit(2,context.eflags,value); //2=pf
      22: setbit(4,context.eflags,value); //4=af
      23: setbit(6,context.eflags,value); //6=zf
      24: setbit(7,context.eflags,value); //7=sf
      25: setbit(10,context.eflags,value); //10=df
      26: setbit(11,context.eflags,value); //11=of

      {$ifdef cpu64}
      6408: context.r8:=value;
      6409: context.r9:=value;
      6410: context.r10:=value;
      6411: context.r11:=value;
      6412: context.r12:=value;
      6413: context.r13:=value;
      6414: context.r14:=value;
      6415: context.r15:=value;
      {$endif}
    end;

  end;
end;

procedure TMemoryBrowser.EAXLabelDblClick(Sender: TObject);
var x: dword;
    i: integer;
    regname,input: string;
    value: qword;
    rbase: string;
    context: PContext;
    labeltext: string;

begin
  labeltext:=tlabel(sender).Caption;

  if (debuggerthread<>nil) and (debuggerthread.isWaitingToContinue) then
  begin
    with debuggerthread do
    begin
      if processhandler.is64Bit then
        rbase:='R' else rbase:='E';

      i:=tlabel(sender).Tag;
      case i of
        0: regname:=rbase+'AX';
        1: regname:=rbase+'BX';
        2: regname:=rbase+'CX';
        3: regname:=rbase+'DX';
        4: regname:=rbase+'SI';
        5: regname:=rbase+'DI';
        6: regname:=rbase+'BP';
        7: regname:=rbase+'SP';
        8: regname:=rbase+'IP';
        9: regname:='CS';
        10: regname:='SS';
        11: regname:='DS';
        12: regname:='ES';
        13: regname:='FS';
        14: regname:='GS';
        20: regname:='CF';
        21: regname:='PF';
        22: regname:='AF';
        23: regname:='ZF';
        24: regname:='SF';
        25: regname:='DF';

        6408..6415: regname:='R'+inttostr(i-6400);
      end;


      input:=copy(labeltext,rpos(' ',labeltext)+1,length(labeltext));
      if (i<20) or (i>6400) then
      begin
        if not inputquery(rsChangeRegister, Format(rsWhatIsTheNewValueOf, [regname]), input) then exit;
      end
      else
      begin
        if not inputquery(rsChangeRegister, Format(rsWhatIsTheNewValueOf, [regname])+' '+rs0Or1, input) then exit;
        input:=trim(input);
        if (input<>'0') and (input<>'1') then
          raise exception.create(Format(rsIsNotAValidValue, [input]));

      end;

      value:=symhandler.getAddressFromName(input);


      SetContextValueByTag(value, tlabel(sender).Tag);




      if (tlabel(sender).Tag>=9) and (tlabel(sender).tag<6400) then //flags or segment registers
      begin
        if (tlabel(sender).Tag>=20) then //flag
          tlabel(sender).Caption:=regname+' '+inttohex(value,1)
        else
          tlabel(sender).Caption:=regname+' '+inttohex(value,4);
      end
      else
      begin
        //normal reg
        tlabel(sender).Caption:=regname+' '+inttohex(value,processhandler.pointersize*2)
      end;
    end;

  end;

end;

procedure TMemoryBrowser.Break1Click(Sender: TObject);
//var threadhandle: thandle;
var
  threadlist: TList;
  needform: boolean;
  threadhandle: thandle;
  i: integer;
begin
  if not startdebuggerifneeded then exit;

  threadhandle:=0;
  needform:=false;
  threadlist:=debuggerthread.lockThreadlist;
  try
    if threadlist.count=1 then
    begin
      threadhandle:=TDebugThreadHandler(threadlist[0]).handle;

    end
    else
    if threadlist.count>1 then
      needform:=true
    else exit; //no threads

  finally
    debuggerthread.unlockThreadlist;
  end;

  if needform then
  begin
    //multiple threads!!! Ask user which one
    frmbreakthread:=tfrmbreakthread.create(self);
    if frmbreakthread.showmodal=mrOK then  threadhandle:=frmbreakthread.threadhandle else
    begin
      frmbreakthread.free;
      frmbreakthread:=nil;
      exit;
    end;

    frmbreakthread.free;
    frmbreakthread:=nil;

  end;

  if threadhandle<>0 then
  begin
    threadlist:=debuggerthread.lockThreadlist;
    try
      //find the thread with this handle and tell it to break
      for i:=0 to threadlist.count-1 do
        if TDebugThreadHandler(threadlist[i]).handle=threadhandle then
        begin
          TDebugThreadHandler(threadlist[i]).BreakThread;
          exit;
        end;
    finally
      debuggerthread.unlockThreadlist;
    end;
  end;
end;

procedure TMemoryBrowser.Reservememory1Click(Sender: TObject);
var count: string;
    memsize: integer;
    baseaddress: pointer;
    x: dword;
    s: string;
begin
  count:='4096';
  if inputquery(rsAllocateMemory, rsHowMuchMemoryDoYouWantToAddToThisProcess, count) then
  begin
    try
      memsize:=StrToInt(count);
    except
      raise exception.Create(Format(rsHowMuchIs, [count]));
    end;

    baseaddress:=nil;
    baseaddress:=VirtualAllocEx(processhandle,nil,memsize,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
    if baseaddress=nil then
      raise exception.Create(rsErrorAllocatingMemory);

    if (disassemblerview.SelectedAddress<>0) and (memsize>7) and (messagedlg(Format(rsAtLeastBytesHaveBeenAllocatedAtDoYouWantToGoThereN, [IntToStr(memsize), IntToHex(ptrUint(baseaddress), 8), #13
      +#10]), mtConfirmation, [mbyes, mbno], 0)=mryes) then
      disassemblerview.SelectedAddress:=ptrUint(baseaddress);
  end;
end;

procedure TMemoryBrowser.Savememoryregion1Click(Sender: TObject);
{will save a cheat engine memory region file .CEM}
begin
  if frmSaveMemoryRegion=nil then
    frmSaveMemoryRegion:=TFrmSaveMemoryRegion.create(self);

  frmSaveMemoryRegion.showmodal;
end;

procedure TMemoryBrowser.Loadmemolryregion1Click(Sender: TObject);
begin

  if openmemory.Execute then
  begin
    tfrmloadmemory.Create(self).Showmodal(openmemory.filename);
  end;
end;

procedure TMemoryBrowser.HexEditDblClick(Sender: TObject);
begin
  change1.Click;
end;

procedure TMemoryBrowser.Debugstrings1Click(Sender: TObject);
begin
  {$ifndef net}

  if startdebuggerifneeded then
    formdebugstrings.show;
  {$endif}
end;

procedure TMemoryBrowser.TextEditExit(Sender: TObject);
var bt: byte;
    aw: dword;
begin
end;

procedure TMemoryBrowser.TextEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
end;

procedure TMemoryBrowser.CreateThread1Click(Sender: TObject);
var startaddress: ptrUint;
    parameter: ptrUint;
    ThreadID: dword;
    start:string;
    param:string;
begin
  start:=IntToHex(disassemblerview.SelectedAddress,8);
  param:='0';
  if not InputQuery(rsCreateRemoteThread, rsWhatWillBeTheStartaddressOfThisThread, start) then exit;
  try
    startaddress:=StrToQWordEx('$'+start);
  except
    raise exception.Create(rsPleaseEnterAValidHexadecimalAddres);
  end;

  if not InputQuery(rsCreateRemoteThread, rsYouWantToGiveAnAdditional32BitParameterWillShowUpI, param) then exit;
  try
    parameter:=StrToInt('$'+param);
  except
    raise exception.Create(rsPleaseEnterAValidHexadecimalValue);
  end;

  if CreateRemoteThread(processhandle,nil,0,pointer(startaddress),pointer(parameter),0,threadid)=0 then raise exception.Create('Creation of the remote thread failed') else showmessage('Thread Created');
end;

procedure TMemoryBrowser.MemoryRegions1Click(Sender: TObject);
begin
  formmemoryregions:=tformmemoryregions.Create(self);
  formmemoryregions.show;
end;


procedure TMemoryBrowser.TextEditKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TMemoryBrowser.FillMemory1Click(Sender: TObject);
begin

  frmFillMemory:=TFrmFillMemory.create(self);
  with frmFillMemory do
  begin
    edit1.Text:=IntToHex(disassemblerview.SelectedAddress,8);
    edit2.Text:=IntToHex(disassemblerview.SelectedAddress+1,8);
    frmFillMemory.showmodal;
  end;

end;

procedure TMemoryBrowser.Disectwindow1Click(Sender: TObject);
begin

  {$ifndef net}
  frmdissectWindow:=tfrmdissectWindow.create(self);
  frmdissectWindow.showmodal;
  {$endif}
end;

procedure TMemoryBrowser.Savedisassemledoutput1Click(Sender: TObject);
var x,y: string;
    start,stop: ptrUint;
    output: textfile;

begin

  with tfrmSavedisassembly.create(self) do
  begin
    start:=minX(disassemblerview.SelectedAddress,disassemblerview.SelectedAddress2);
    stop:=maxX(disassemblerview.SelectedAddress,disassemblerview.SelectedAddress2);
    disassemble(stop);
    edit1.Text:=inttohex(start,8);
    edit2.Text:=inttohex(stop,8);
    show;
  end;
end;

procedure TMemoryBrowser.Heaps1Click(Sender: TObject);
begin
  if processid=0 then
  begin
    messagedlg(rsPleaseTargetAProcessFirst, mterror, [mbOK], 0);
    exit;
  end;

  if processid=GetCurrentProcessId then
  begin
    messagedlg(rsPleaseTargetAnotherProcess, mterror, [mbOK], 0);
    exit;
  end;


  if (frmMemoryAllocHandler<>nil) and (frmMemoryAllocHandler.hookedprocessid<>processid) then
    freeandnil(frmMemoryAllocHandler);

  if frmheaps=nil then
    frmheaps:=tfrmheaps.create(self);

  frmheaps.show;
end;

procedure TMemoryBrowser.EnumeratedllsandSymbols1Click(Sender: TObject);
begin
  symhandler.reinitialize;
  
  if frmEnumerateDLLs=nil then
    frmEnumerateDLLs:=tfrmEnumerateDLLs.create(application);

  frmEnumerateDLLs.show;
  frmEnumerateDLLs.enumerate;
end;

procedure TMemoryBrowser.InjectDLL1Click(Sender: TObject);
var dll: string;
    functionname: string;
    dllList: tstringlist;
begin

  functionname:='';
  dll:='';

  if opendlldialog.Execute then
  begin
    dll:=utf8toansi(opendlldialog.Filename);
    if MessageDlg(rsDoYouWantToExecuteAFunctionOfTheDll, mtConfirmation	, [mbyes, mbno], 0)=mryes then
    begin
      dllList:=tstringlist.Create;

      try
        try
          peinfo_getExportList(opendlldialog.filename, dllList);

          with TfrmSelectionList.create(self,dllList) do
          begin
            caption:=rsInjectDll;
            label1.caption:=rsSelectTheFunctionYouWantToExecute;
            if showmodal=mrok then
              if itemindex<>-1 then
                functionname:=selected;

            free;
          end;
        except

        end;
      finally
        dllList.free;
      end;
    end;

    InjectDll(dll,functionname);
    symhandler.reinitialize(true);
    showmessage(rsDLLInjected);
  end;
end;

procedure TMemoryBrowser.AutoInject1Click(Sender: TObject);
begin
  tfrmautoinject.create(self).show;
end;

procedure TMemoryBrowser.Dissectcode1Click(Sender: TObject);
begin

  {$ifndef net}
  if frmdissectcode=nil then
    frmdissectcode:=tfrmDissectcode.create(self);

  frmdissectcode.Show;
  {$endif}
end;

procedure TMemoryBrowser.Createjumptocodecave1Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.Findstaticpointers1Click(Sender: TObject);
begin

{$ifndef net}
  if frmfindstatics=nil then
    frmfindstatics:=tfrmfindstatics.create(self);

  frmfindstatics.show;
{$endif}
end;

procedure TMemoryBrowser.Scanforcodecaves1Click(Sender: TObject);
begin

  if frmcodecavescanner=nil then
    frmcodecavescanner:=tfrmCodecaveScanner.create(self);

  frmCodecavescanner.show;
end;

procedure TMemoryBrowser.Changestateofregisteratthislocation1Click(
  Sender: TObject);
begin
  tfrmModifyRegisters.create(self,disassemblerview.SelectedAddress).showmodal;
end;

procedure TMemoryBrowser.miTogglebreakpointClick(Sender: TObject);
begin
  if startdebuggerifneeded(true) then
  begin
    DebuggerThread.ToggleOnExecuteBreakpoint(disassemblerview.SelectedAddress);
    disassemblerview.Update;
  end;
end;

procedure TMemoryBrowser.Breakpointlist1Click(Sender: TObject);
begin
  if frmbreakpointlist=nil then
  begin
    frmbreakpointlist:=tfrmBreakpointlist.create(self);
    frmBreakpointlist.show;
  end
  else
    frmbreakpointlist.bringtofront;
end;


procedure TMemoryBrowser.Makepagewritable1Click(Sender: TObject);
var x: dword;
begin
  VirtualProtectEx(processhandle,pointer(memoryaddress),4096,PAGE_EXECUTE_READWRITE,x);
//  if (memoryaddress>80000000) and (DarkByteKernel<>0) then
//    MakeWritableEx(processhandle,memoryaddress,4096,false);

end;

procedure TMemoryBrowser.Dissectdata1Click(Sender: TObject);
begin

{$ifndef net}
  with tfrmpointerscanner.create(self) do
    show;
{$endif}
end;

procedure TMemoryBrowser.Showsymbols1Click(Sender: TObject);
begin
  showsymbols1.Checked:=not showsymbols1.Checked;
  symhandler.showsymbols:=showsymbols1.Checked;
  disassemblerview.Update;
end;

procedure TMemoryBrowser.Showmoduleaddresses1Click(Sender: TObject);
begin
  Showmoduleaddresses1.Checked:=not Showmoduleaddresses1.checked;
  symhandler.showmodules:=Showmoduleaddresses1.Checked;
  disassemblerview.Update;
end;


procedure TMemoryBrowser.miDissectDataClick(Sender: TObject);
begin
  {
  if length(frmStructures)>0 then
  begin
    frmStructures[0].edtAddress.Text:=inttohex(memorybrowser.memoryaddress,8);
    frmStructures[0].Show;
  end
  else
  begin
    //create it
    with tfrmstructures.create(self) do
    begin
      edtAddress.Text:=inttohex(memoryaddress,8);
      applychanges(false);
      show;
    end;
  end; }
end;

procedure TMemoryBrowser.Symbolhandler1Click(Sender: TObject);
begin
  if frmSymbolhandler=nil then
    frmSymbolhandler:=TfrmSymbolhandler.create(self);

  frmSymbolhandler.show;
end;

procedure TMemoryBrowser.Allocatenonpagedmemory1Click(Sender: TObject);
var count: string;
    memsize: integer;
    baseaddress: pointer;
    x: dword;
    s: string;
begin
{$ifndef net}
  count:='4096';
  if inputquery(rsAllocateMemory, rsHowMuchMemoryDoYouWishToAllocate, count) then
  begin
    try
      memsize:=StrToInt(count);
    except
      raise exception.Create(Format(rsHowMuchIs, [count]));
    end;

    baseaddress:=nil;
    baseaddress:=KernelAlloc(memsize);
    if baseaddress=nil then
      raise exception.Create(rsErrorAllocatingMemory);

    if messagedlg(Format(rsAtLeastBytesHaveBeenAllocatedAtGoThereNow, [IntToStr(memsize), IntToHex(ptrUint(baseaddress), 8)]), mtinformation, [mbyes, mbno], 0) = mryes then
      disassemblerview.SelectedAddress:=ptrUint(baseaddress);
  end;
  {$endif}
end;

procedure TMemoryBrowser.Getaddress1Click(Sender: TObject);
var p: pointer;
    s: string;
    ws: widestring;
    pws: pwidechar;
begin
  if inputquery(rsGetKernelAddress, rsGiveTheNameOfTheFunctionYouWantToFindCaseSensitive, s) then
  begin
    ws:=s;
    pws:=@ws[1];
    p:=GetKProcAddress(pws);

    disassemblerview.SelectedAddress:=ptrUint(p);
  end;
end;

procedure TMemoryBrowser.Findmemory1Click(Sender: TObject);
begin
  search1.Click;
end;

procedure TMemoryBrowser.Assemblycode1Click(Sender: TObject);
var
  fromaddress: ptruint;
  toaddress: ptruint;


begin
  if frmAssemblyScan=nil then
    frmAssemblyScan:=tfrmassemblyscan.create(self);

  frmAssemblyScan.edtFrom.text:=inttohex(disassemblerview.TopAddress,8);

  if processhandler.is64Bit then
    frmAssemblyScan.edtTo.text:='FFFFFFFFFFFFFFFF'
  else
    frmAssemblyScan.edtTo.text:='FFFFFFFF';


  if frmAssemblyScan.ShowModal=mrok then
  begin
    if frmAssemblyScan.mAssemblerSearch.lines.Count=0 then exit;
    with TfrmDisassemblyscan.create(self) do
    begin
      startaddress:=frmAssemblyScan.startaddress;
      stopaddress:=frmAssemblyScan.stopaddress;
      stringstofind:=frmAssemblyScan.mAssemblerSearch.lines;
      show;
    end;

  end;
end;

procedure TMemoryBrowser.Driverlist1Click(Sender: TObject);
begin
  {$ifndef net}

  with tfrmdriverlist.create(self) do
    show;
  {$endif}
end;

procedure TMemoryBrowser.plugintype6click(sender:tobject);
var
  x: TPluginfunctionType6;
  selectedaddress: ptrUint;
begin
  x:=TPluginfunctionType6(tmenuitem(sender).Tag);
  if x<>nil then
  begin
    selectedaddress:=disassemblerview.SelectedAddress;
    x.callback(@selectedaddress);
    disassemblerview.SelectedAddress:=selectedaddress;
  end;
end;

procedure TMemoryBrowser.plugintype1click(sender:tobject);
var x: TPluginfunctionType1;
address: ptrUint;
hexviewaddress: ptrUint;
seladdress: ptruint;
begin
  x:=TPluginfunctionType1(tmenuitem(sender).Tag);
  if x<>nil then
  begin
    address:=disassemblerview.TopAddress;
    hexviewaddress:=memoryaddress;
    seladdress:=disassemblerview.SelectedAddress;
    if x.callback(@address,@seladdress,@hexviewaddress) then
    begin
      disassemblerview.TopAddress:=address;
      disassemblerview.selectedaddress:=seladdress;
      memoryaddress:=hexviewaddress;
    end;
  end;
end;

procedure TMemoryBrowser.Sericedescriptortable1Click(Sender: TObject);
begin
{$ifndef net}

  if frmServiceDescriptorTables=nil then
    frmServiceDescriptorTables:=TfrmServiceDescriptorTables.create(self);

  frmServiceDescriptorTables.show;
{$endif}
end;

procedure TMemoryBrowser.MBCanvasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TMemoryBrowser.Cut1Click(Sender: TObject);
begin
  hexview.CopySelectionToClipboard;
end;

procedure TMemoryBrowser.Pastefromclipboard1Click(Sender: TObject);
begin
  hexview.PasteFromClipboard;
end;

procedure TMemoryBrowser.Setsymbolsearchpath1Click(Sender: TObject);
var searchpath: string;
begin
  if inputquery(rsSymbolHandler, rsPleaseSpecifyTheNewSymbolSearchpathSeperatesPaths, searchpath) then
  begin
    symhandler.setsearchpath(searchpath);

    symhandler.reinitialize(true);
  end;
end;

procedure TMemoryBrowser.Kernelmodesymbols1Click(Sender: TObject);
begin
{$ifndef net}

  Kernelmodesymbols1.Checked:=not Kernelmodesymbols1.Checked;

  symhandler.kernelsymbols:=Kernelmodesymbols1.Checked;
  symhandler.reinitialize;
  symhandler.waitforsymbolsloaded(true);
{$endif}
end;

procedure TMemoryBrowser.Breakandtraceinstructions1Click(Sender: TObject);
begin
  TFrmTracer.create(self).show;
end;

procedure TMemoryBrowser.debuggerpopupPopup(Sender: TObject);
var x: ptrUint;
  i: integer;

  inadvancedoptions: boolean;
begin
  Breakandtraceinstructions1.Enabled:=processhandle<>0;
  miTogglebreakpoint.Enabled:=processhandle<>0;
  Changestateofregisteratthislocation1.Enabled:=processhandle<>0;
  Findoutwhataddressesthisinstructionaccesses1.enabled:=processhandle<>0;

  follow1.visible:=isjumporcall(disassemblerview.SelectedAddress,x);
  back1.Visible:=backlist.Count>0;

  pluginhandler.handledisassemblerContextPopup(disassemblerview.SelectedAddress);

  miConditionalBreak.enabled:=(debuggerthread<>nil) and (debuggerthread.isBreakpoint(disassemblerview.SelectedAddress)<>nil);


  miTogglebreakpoint.visible:=not ischild;

  inadvancedoptions:=false;

  for i:=0 to AdvancedOptions.numberofcodes-1 do
  begin
    if InRangeX(disassemblerview.SelectedAddress, AdvancedOptions.code[i].Address, AdvancedOptions.code[i].Address+length(AdvancedOptions.code[i].actualopcode)-1 ) then
    begin
      inadvancedoptions:=true;

      if AdvancedOptions.code[i].changed then
        miReplacewithnops.caption:=rsRestoreWithOrginalCode
      else
        miReplacewithnops.caption:=rsReplaceWithCodeThatDoesNothing;

      break;
    end;
  end;

  if not inadvancedoptions then
    miReplacewithnops.caption:=rsReplaceWithCodeThatDoesNothing;

  miAddToTheCodelist.visible:=not inadvancedoptions;
end;

procedure TMemoryBrowser.GDTlist1Click(Sender: TObject);
begin

  Tfrmgdtinfo.create(self).show;
end;

procedure TMemoryBrowser.IDTlist1Click(Sender: TObject);
begin

  TfrmIDT.create(self).show;
end;



procedure TMemoryBrowser.FormDestroy(Sender: TObject);
var h0,h1,h2,h3: integer;
begin
  MemoryBrowsers.Remove(self);

  if strace<>nil then
    strace.free;

  if disassemblerHistory<>nil then
    freeandnil(disassemblerHistory);

  if memorybrowserhistory<>nil then
    freeandnil(memorybrowserHistory);

  if assemblerHistory<>nil then
    freeandnil(assemblerHistory);

  //save position of window and other stuff
  //membrowser comes after formsettings so is destroyed before formsettings, so valid
  if (not ischild) then
  begin
    if disassemblerview<>nil then
    begin
      saveformposition(self,[
                              disassemblerview.getheaderwidth(0),
                              disassemblerview.getheaderwidth(1),
                              disassemblerview.getheaderwidth(2),
                              disassemblerview.getheaderwidth(3),
                              panel1.height,
                              registerview.width,
                              strtoint(BoolToStr(Showsymbols1.checked,'1','0')),
                              strtoint(BoolToStr(Showmoduleaddresses1.checked,'1','0'))
                      ]);


    end;
  end;

  if disassemblerview<>nil then
    freeandnil(self.disassemblerview);

  if self.hexview<>nil then
    freeandnil(self.hexview);


end;

procedure TMemoryBrowser.Newwindow1Click(Sender: TObject);
begin
  with tmemorybrowser.create(application) do
  begin
    inc(mbchildcount);
    name:=rsMemoryBrowser+inttostr(mbchildcount);
    debug1.Visible:=false;
    debug1.enabled:=false;
    //registerview.Visible:=false;
    //splitter2.Visible:=false;
    sbShowFloats.Visible:=false;
    Setbreakpoint1.visible:=false;

    caption:=caption+'* ('+inttostr(mbchildcount)+')';

    Kerneltools1.enabled:=memorybrowser.Kerneltools1.enabled;

    ischild:=true;
    show;
  end;
end;


procedure TMemoryBrowser.Follow1Click(Sender: TObject);
{
will change the selected disassembler address to the address this instructions jump so if it is an jump instruction
}
var address: ptrUint;
begin
  if isjumporcall(disassemblerview.SelectedAddress,address) then
  begin
    backlist.Push(pointer(disassemblerview.SelectedAddress));
    disassemblerview.SelectedAddress:=address;
  end;
end;



procedure TMemoryBrowser.CopyBytesAndOpcodesClick(Sender: TObject);
var a,b: ptrUint;
    _tag: integer;
begin


  _tag:=(sender as tmenuitem).Tag;


  with tfrmSavedisassembly.create(self) do
  begin

    a:=minX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);
    b:=maxX(disassemblerview.SelectedAddress, disassemblerview.SelectedAddress2);
    
    disassemble(b); //b gets increased with size of selected instruction
    edit1.Text:=inttohex(a,8);
    edit2.Text:=inttohex(b-1,8);
    copymode:=true;


    cbAddress.checked:=_tag<>3;
    cbBytes.checked:=(_tag=0) or (_tag=1) or (_tag=3);
    cbOpcode.checked:=(_tag=0) or (_tag=2);
    
    button1.click;
    waittilldone;

    free;
  end;


end;

procedure TMemoryBrowser.DissectPEheaders1Click(Sender: TObject);
begin

  with TfrmPEInfo.create(self) do
    show;
end;

procedure TMemoryBrowser.GetEntryPointAndDataBase(var code: ptrUint; var data: ptrUint);
var modulelist: tstringlist;
    base: ptrUint;
    header: pointer;
    headersize: dword;
    br: ptrUint;
begin
  code:=$00400000;
  data:=$00400000; //on failure

  modulelist:=tstringlist.Create;
  symhandler.getModuleList(modulelist);
  outputdebugstring('Retrieved the module list');

  if modulelist.Count>0 then
  begin
    base:=ptrUint(modulelist.Objects[0]);

    outputdebugstring('Base='+inttohex(base,8));


    getmem(header,4096);
    try
      if readprocessmemory(processhandle,pointer(base),header,4096,br) then
      begin
        headersize:=peinfo_getheadersize(header);

        if headersize>0 then
        begin
          OutputDebugString('headersize='+inttostr(headersize));
          if headersize>1024*512 then exit;

          freemem(header);
          getmem(header,headersize);
          if not readprocessmemory(processhandle,pointer(base),header,headersize,br) then exit;

          Outputdebugstring('calling peinfo_getEntryPoint');
          code:=base+peinfo_getEntryPoint(header, headersize);

          OutputDebugString('calling peinfo_getdatabase');
          data:=base+peinfo_getdatabase(header, headersize);
        end;


      end;
    finally
      freemem(header);
    end;
  end;
  modulelist.free;
end;

procedure TMemoryBrowser.setcodeanddatabase;
var code,data: ptrUint;
begin
  if processid=$ffffffff then  //file instead of process
  begin
    code:=0;
    data:=0;
  end
  else
    GetEntryPointAndDataBase(code,data);

  disassemblerview.SelectedAddress:=code;
  memoryaddress:=data;


end;

procedure TMemoryBrowser.AddToDisassemblerBackList(address: pointer);
begin
  backlist.Push(address);
end;

procedure TMemoryBrowser.Back1Click(Sender: TObject);
begin
  if backlist.Count>0 then
    disassemblerview.SelectedAddress:=ptrUint(backlist.pop);
end;

procedure TMemoryBrowser.Showvaluesofstaticaddresses1Click(
  Sender: TObject);
begin
  showvalues:=not showvalues;
end;

procedure TMemoryBrowser.FindwhatThiscodeAccesses(address: ptrUint);
var i: integer;
begin
  if not startdebuggerifneeded then exit;
  if debuggerthread<>nil then
    debuggerthread.FindWhatCodeAccesses(address);
end;

procedure TMemoryBrowser.Findoutwhataddressesthisinstructionaccesses1Click(
  Sender: TObject);
begin
  try
    findWhatthisCodeAccesses(disassemblerview.SelectedAddress);

  except
    on e: Exception do
    begin
      MessageDlg(e.message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TMemoryBrowser.sbShowFloatsClick(Sender: TObject);
  var x: tpoint;
z: trect;
begin

  if frmFloatingPointPanel=nil then
    frmFloatingPointPanel:=TfrmFloatingPointPanel.create(self);

  frmFloatingPointPanel.Left:=self.left+self.Width;
  frmFloatingPointPanel.Top:=self.top+(self.ClientOrigin.y-self.top)-(frmFloatingPointPanel.ClientOrigin.y-frmFloatingPointPanel.top);
  frmFloatingPointPanel.ClientHeight:=scrollbox1.Height;

  frmFloatingPointPanel.SetContextPointer(@lastdebugcontext);
  frmFloatingPointPanel.show;//pop to foreground
end;

procedure TMemoryBrowser.ScriptConsole1Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.DisplayTypeClick(Sender: TObject);
var x: tmenuitem;
begin
//vtByte, vtWord, vtDword, vtDwordDec, vtSingle, vtDouble
  if (sender is TMenuItem) then
  begin
    x:=TMenuItem(sender);
    case x.tag of
      0: hexview.DisplayType:=dtByte;
      1: hexview.DisplayType:=dtByteDec;
      2: hexview.DisplayType:=dtWord;
      3: hexview.DisplayType:=dtWordDec;
      4: hexview.DisplayType:=dtDword;
      5: hexview.DisplayType:=dtDwordDec;
      6: hexview.DisplayType:=dtQword;
      7: hexview.DisplayType:=dtQwordDec;
      8: hexview.DisplayType:=dtsingle;
      9: hexview.DisplayType:=dtDouble;
    end;
  end;
end;

procedure TMemoryBrowser.Showjumplines1Click(Sender: TObject);
begin
  showjumplines1.checked:=not showjumplines1.checked;
  disassemblerview.showjumplines:=showjumplines1.checked;

  Onlyshowjumplineswithinrange1.Enabled:=showjumplines1.checked;
end;

procedure TMemoryBrowser.Onlyshowjumplineswithinrange1Click(
  Sender: TObject);
begin
  Onlyshowjumplineswithinrange1.checked:=not Onlyshowjumplineswithinrange1.checked;
  if Onlyshowjumplineswithinrange1.checked then
    disassemblerview.ShowJumplineState:=jlsOnlyWithinRange
  else
    disassemblerview.ShowJumplineState:=jlsAll;

end;

procedure TMemoryBrowser.Watchmemoryallocations1Click(Sender: TObject);
begin
  if processid=0 then
  begin
    MessageDlg(rsPleaseTargetAProcessFirst, mtError,[mbok], 0);
    exit;
  end;

  if processid=GetCurrentProcessId then
  begin
    MessageDlg(rsPleaseTargetAnotherProcess, mtError,[mbok], 0);
    exit;
  end;


  if (frmMemoryAllocHandler<>nil) and (frmMemoryAllocHandler.hookedprocessid<>processid) then
    freeandnil(frmMemoryAllocHandler);


  if frmMemoryAllocHandler=nil then
    frmMemoryAllocHandler:=TfrmMemoryAllocHandler.Create(self);

  frmMemoryAllocHandler.Show;
end;

procedure TMemoryBrowser.Continueanddetachdebugger1Click(Sender: TObject);
begin

end;

procedure TMemoryBrowser.ScrollBox1Resize(Sender: TObject);
begin
//  sbShowFloats.Top:=max(oflabel.top+oflabel.height+2 , scrollbox1.vertscrollbar.Position+(registerview.ClientHeight div 2)-sbShowFloats.Height div 2);
  sbShowFloats.Left:=ScrollBox1.clientwidth - sbShowFloats.Width;

  scrollbox1.vertscrollbar.range:=(gslabel.top+gslabel.height+scrollbox1.vertscrollbar.page)-scrollbox1.clientheight;
  Scrollboxscroll(Scrollbox1);
end;

procedure TMemoryBrowser.reloadStacktrace;
var s: pptrUintarray;
    x: ptrUint;
    
    i: integer;
    address, bytes, details: string;
    li: tlistitem;
    c: TListcolumn;
begin

  lvStacktraceData.Items.BeginUpdate;
  try
    if stacktrace2.Checked then
    begin
      //setup view for stacktrace if it isn't setup yet
      if lvStacktraceData.columns.Count=3 then
      begin
        lvstacktracedata.Columns.BeginUpdate;
        try
          lvstacktracedata.Columns.Clear;
          c:=lvstacktracedata.Columns.Add;
          c.Caption:=rsReturnAddress;
          c.Width:=lvstacktracedata.Canvas.TextWidth('DDDDDDDD');
          c.AutoSize:=true;


          c:=lvstacktracedata.Columns.Add;
          c.Caption:=rsParameters;
          c.Width:=200;
          c.AutoSize:=true;

        finally
          lvstacktracedata.Columns.EndUpdate;
        end;
      end;

      if frmstacktrace=nil then
        frmstacktrace:=tfrmstacktrace.create(self);


      lvstacktracedata.Items.Count:=frmstacktrace.ListView1.Items.Count;
    end
    else
    begin
      //setup view for stackview if it isn't setup yet
      if lvStacktraceData.columns.Count<>3 then
      begin
        lvstacktracedata.Columns.BeginUpdate;
        try
          lvstacktracedata.Columns.Clear;
          c:=lvstacktracedata.Columns.Add;
          c.Caption:=rsAddress;
          c.Width:=80;
          c:=lvstacktracedata.Columns.Add;
          if processhandler.is64bit then
          begin
            c.Caption:='QWORD';
            c.width:=160;
          end
          else
          begin
            c.Caption:='DWORD';
            c.Width:=80;
          end;

          c:=lvstacktracedata.Columns.Add;
          c.Caption:=rsValue;
          c.Width:=100;
          c.AutoSize:=true;
        finally
          lvstacktracedata.Columns.EndUpdate;
        end;
      end;

      if all1.checked =false then
      begin
        //just get the list
        getmem(s,FStacktraceSize);
        try
          readprocessmemory(processhandle, pointer(lastdebugcontext.{$ifdef cpu64}rsp{$else}esp{$endif}),s, FStacktraceSize,x);
          strace.Clear;

          ce_stacktrace(lastdebugcontext.{$ifdef cpu64}rsp{$else}esp{$endif}, lastdebugcontext.{$ifdef cpu64}rbp{$else}ebp{$endif}, lastdebugcontext.{$ifdef cpu64}rip{$else}eip{$endif}, pbytearray(s),x, strace,false,Nonsystemmodulesonly1.checked or modulesonly1.Checked,Nonsystemmodulesonly1.checked,0,miAddEBP.checked);

          lvstacktracedata.Items.Count:=strace.Count;
        finally
          freemem(s);
        end;
      end else
      begin
        lvstacktracedata.Items.Count:=(FStacktraceSize div processhandler.pointersize)-1;
      end;

    end;
  finally
    lvStacktraceData.Items.EndUpdate;
    lvStacktraceData.Refresh;
  end;

end;

procedure TMemoryBrowser.Maxstacktracesize1Click(Sender: TObject);
var
  s: string;
begin
  s:=inttostr(stacktraceSize);
  InputQuery(rsStacktrace, rsNewSize+':', s);
  try
    stacktraceSize:=strtoint(s);
    Maxstacktracesize1.Caption:=rsMaxStacktraceSize+': '+inttostr(stacktracesize);
  except
  end;
end;

procedure TMemoryBrowser.All1Click(Sender: TObject);
begin
  all1.checked:=true;
  Modulesonly1.Checked:=false;
  Nonsystemmodulesonly1.Checked:=false;
  stacktrace2.Checked:=false;
  reloadstacktrace;
end;

procedure TMemoryBrowser.Modulesonly1Click(Sender: TObject);
begin
  all1.checked:=false;
  Modulesonly1.Checked:=true;
  Nonsystemmodulesonly1.Checked:=false;
  stacktrace2.Checked:=false;
  reloadstacktrace;
end;

procedure TMemoryBrowser.Nonsystemmodulesonly1Click(Sender: TObject);
begin
  all1.checked:=false;
  Modulesonly1.Checked:=false;
  Nonsystemmodulesonly1.Checked:=true;
  stacktrace2.Checked:=false;
  reloadstacktrace;
end;

procedure TMemoryBrowser.stacktrace2Click(Sender: TObject);
begin
  all1.checked:=false;
  Modulesonly1.Checked:=false;
  Nonsystemmodulesonly1.Checked:=false;
  stacktrace2.Checked:=true;
  reloadstacktrace;
end;

procedure TMemoryBrowser.miReferencedFunctionsClick(Sender: TObject);
begin
  if (dissectcode=nil) then
  begin
    if MessageDlg(rsNeedToRunDissectCode, mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      Dissectcode1Click(sender);
      frmDissectCode.ondone:=odOpenReferedFunctionsList;
      frmDissectCode.btnStart.click;
    end;
  end else
  begin
    if frmReferencedFunctions=nil then
      frmReferencedFunctions:=tfrmReferencedFunctions.Create(self);

    frmReferencedFunctions.Show;
  end;
end;

procedure TMemoryBrowser.Referencedstrings1Click(Sender: TObject);
begin

  if (dissectcode=nil) then
  begin
    if MessageDlg(rsNeedToRunDissectCode, mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      Dissectcode1Click(sender);
      frmDissectCode.ondone:=odOpenReferedStringList;
      frmDissectCode.btnStart.click;
    end;
  end else
  begin
    if frmReferencedStrings=nil then
      frmReferencedStrings:=tfrmReferencedStrings.Create(self);

    frmReferencedStrings.Show;
  end;
end;


function TMemoryBrowser.GetReturnaddress: ptrUint;
var
  haserror: boolean;
  stack: array [0..1023] of ptrUint;
  x: ptrUint;
  i: integer;
begin

  result:=0;

  //do a stacktrace and find the return address

  if frmstacktrace=nil then
    frmstacktrace:=tfrmstacktrace.create(self);

  if frmStacktrace.ListView1.Items.Count>0 then
  begin
    result:=symhandler.getAddressFromName(frmStacktrace.ListView1.Items[0].SubItems[2], false,haserror);
    if haserror then result:=0;
  end;

  if result=0 then
  begin

    //go through the stack and find a entry that falls in executable memory
    ReadProcessMemory(processhandle, pointer(lastdebugcontext.{$ifdef cpu64}rsp{$else}Esp{$endif}), @stack[0], 4096, x);
    for i:=0 to (x div processhandler.pointersize) do
    begin
      if symhandler.inModule(stack[i]) and isExecutableAddress(stack[i]) then
      begin
        result:=stack[i]; //best guess, it's an address specifier, it falls inside a module, and it's executable
        exit;
      end;
    end;
  end;
end;

procedure TMemoryBrowser.Executetillreturn1Click(Sender: TObject);
var x: ptrUint;
begin
  begin
    x:=getreturnaddress;
    if x>0 then
    begin
      disassemblerview.SelectedAddress:=x;
      Runtill1.Click;
    end else beep; //not possible
  end;
end;

procedure TMemoryBrowser.lvStacktraceDataData(Sender: TObject; Item: TListItem);
var
  x: dword;
  value: ptrUint;
  a: ptrUint;
  address,bytes,details: string;
  v: TVariableType;
  pref: string;

  offset: ptrint;
  offsetstring: string;
begin

  if stacktrace2.checked then
  begin

    //show frmstacktrace
    if frmStacktrace=nil then
    begin
      frmstacktrace:=TfrmStacktrace.Create(self); //should never happen
    end;

    if item.Index<frmStacktrace.ListView1.Items.Count then
    begin
      item.Caption:=frmStacktrace.ListView1.Items[item.index].SubItems[2]; //returnaddress
      item.SubItems.Add(frmStacktrace.ListView1.Items[item.index].SubItems[3]); //subitems address
    end;
  end
  else
  if all1.checked then
  begin
    //show for each dword what it is


    a:=lastdebugcontext.{$ifdef cpu64}rsp{$else}Esp{$endif}+item.Index*processhandler.pointersize;

    if laststack<>nil then
    begin
      if processhandler.is64bit then
      begin
        pref:='r';
        value:=ptruint(pqword(ptruint(laststack)+item.Index*processhandler.pointersize)^);
        item.SubItems.Add(inttohex(value,16));
      end
      else
      begin
        pref:='e';
        value:=ptruint(pdword(ptruint(laststack)+item.Index*processhandler.pointersize)^);
        item.SubItems.Add(inttohex(value,8));
      end;

      if miAddESP.checked then
        offsetstring:='('+pref+'sp+'+inttohex(item.Index*processhandler.pointersize,1)+')'
      else
      begin
        offset:=a-lastdebugcontext.{$ifdef cpu64}rbp{$else}Ebp{$endif};

        if offset<0 then
          offsetstring:='('+pref+'bp-'+inttohex(-offset,1)+')'
        else
          offsetstring:='('+pref+'bp+'+inttohex(offset,1)+')';
      end;


      item.Caption:=inttohex(a,8)+offsetstring;





      v:=FindTypeOfData(a,pointer(ptruint(laststack)+item.Index*processhandler.pointersize),StacktraceSize-item.Index*processhandler.pointersize);
      if v in [vtbyte..vtQword] then
      begin
        //override into pointersize type
        if processhandler.is64bit then
          v:=vtQword
        else
          v:=vtDword;
      end;

      item.SubItems.Add(DataToString(pbytearray(ptruint(laststack)+item.Index*processhandler.pointersize),processhandler.pointersize, v));
    end;
  end else
  begin
    //show strace

    if strace<>nil then
    begin
      if item.index<strace.count then
      begin
        seperatestacktraceline(strace[item.index], address,bytes,details);
        item.Caption:=address;
        item.SubItems.Add(bytes);
        item.SubItems.Add(details);
      end;
    end;
  end;
end;

procedure TMemoryBrowser.lvStacktraceDataDblClick(Sender: TObject);
var
  hasError: boolean;
  x: ptrUint;

  column : integer;
  cursorpos: tpoint;
  tvrect: trect;
  i: integer;

  currentleft: integer;
  s: string;
begin
  if lvStacktraceData.Selected=nil then exit;

  if stacktrace2.checked then
  begin
    //go to the selected address
    x:=symhandler.getAddressFromName(lvStacktraceData.Selected.Caption,false,haserror);
    if not haserror then
      disassemblerview.SelectedAddress:=x;
  end
  else
  begin
    //depending on what column is selected go to the disassembler/hexview part
    cursorpos:=mouse.CursorPos;
    GetWindowRect(lvStacktraceData.Handle, tvrect);

    //get the relative position
    cursorpos.X:=cursorpos.X-tvrect.Left;
    cursorpos.Y:=cursorpos.Y-tvrect.Top;

    column:=0;

    currentleft:=0;
    for i:=0 to lvStacktraceData.Columns.count-1 do
    begin
      if (cursorpos.X>currentleft) and (cursorpos.X<(currentleft+lvStacktraceData.Columns[i].width)) then
      begin
        column:=i;
        break;
      end;
      inc(currentleft, lvStacktraceData.Columns[i].width);
    end;


    if column=0 then
    begin
      s:=lvStacktraceData.Selected.Caption;
      i:=pos('(', s);
      if i>0 then
        s:=copy(s,1,i-1);

    end
    else
      s:=lvStacktraceData.Selected.SubItems[column-1];

    x:=symhandler.getAddressFromName(s,false,haserror);
    if not haserror then
    begin
      if isExecutableAddress(x) then
        disassemblerview.SelectedAddress:=x
      else
        memoryaddress:=x;
    end;

  end;
end;

procedure TMemoryBrowser.setHexviewAddress(a: ptrUint);
begin
  if hexview<>nil then
    hexview.address:=a;
end;

function TMemoryBrowser.getHexviewAddress:ptrUint;
begin
  if hexview<>nil then
    result:=hexview.address
  else
    result:=0;
end;

procedure TMemoryBrowser.UpdateDebugContext(threadhandle: THandle; threadid: dword);
var temp: string='';
    Regstart: string='';
    charcount: integer=8;
    bs: dword;
    x: ptrUint;
    stackaddress: PtrUInt;
    i: integer=0;

begin
  if processhandler.is64Bit or (processhandler.SystemArchitecture=archArm) then
  begin
    regstart:='R';

    if processhandler.is64Bit then
      charcount:=16
    else
      charcount:=8;

    if r8label=nil then
    begin
      r8label:=tlabel.create(self);
      r8label.parent:=scrollbox1;
      r8label.Font:=eaxlabel.Font;
      r8label.left:=eaxlabel.left;
      r8label.top:=esplabel.top+(ebxlabel.top-eaxlabel.top);
      r8label.Cursor:=eaxlabel.Cursor;
      r8label.Tag:=6408;
      r8label.PopupMenu:=pmRegisters;
      r8label.onclick:=EAXLabelDblClick;
      r8label.OnMouseDown:=RegisterMouseDown;
    end;

    if r9label=nil then
    begin
      r9label:=tlabel.create(self);
      r9label.parent:=scrollbox1;
      r9label.Font:=eaxlabel.Font;
      r9label.left:=eaxlabel.left;
      r9label.top:=r8label.top+(ebxlabel.top-eaxlabel.top);
      r9label.Cursor:=eaxlabel.Cursor;
      r9label.Tag:=6409;
      r9label.PopupMenu:=pmRegisters;
      r9label.onclick:=EAXLabelDblClick;
      r9label.OnMouseDown:=RegisterMouseDown;
    end;

    if r10label=nil then
    begin
      r10label:=tlabel.create(self);
      r10label.parent:=scrollbox1;
      r10label.Font:=eaxlabel.Font;
      r10label.left:=eaxlabel.left;
      r10label.top:=r9label.top+(ebxlabel.top-eaxlabel.top);
      r10label.Cursor:=eaxlabel.Cursor;
      r10label.Tag:=6410;
      r10label.PopupMenu:=pmRegisters;
      r10label.onclick:=EAXLabelDblClick;
      r10label.OnMouseDown:=RegisterMouseDown;
    end;

    if r11label=nil then
    begin
      r11label:=tlabel.create(self);
      r11label.parent:=scrollbox1;
      r11label.Font:=eaxlabel.Font;
      r11label.left:=eaxlabel.left;
      r11label.top:=r10label.top+(ebxlabel.top-eaxlabel.top);
      r11label.Cursor:=eaxlabel.Cursor;
      r11label.Tag:=6411;
      r11label.PopupMenu:=pmRegisters;
      r11label.onclick:=EAXLabelDblClick;
      r11label.OnMouseDown:=RegisterMouseDown;
    end;

    if r12label=nil then
    begin
      r12label:=tlabel.create(self);
      r12label.parent:=scrollbox1;
      r12label.Font:=eaxlabel.Font;
      r12label.left:=eaxlabel.left;
      r12label.top:=r11label.top+(ebxlabel.top-eaxlabel.top);
      r12label.Cursor:=eaxlabel.Cursor;
      r12label.Tag:=6412;
      r12label.PopupMenu:=pmRegisters;
      r12label.onclick:=EAXLabelDblClick;
      r12label.OnMouseDown:=RegisterMouseDown;
    end;

    if r13label=nil then
    begin
      r13label:=tlabel.create(self);
      r13label.parent:=scrollbox1;
      r13label.Font:=eaxlabel.Font;
      r13label.left:=eaxlabel.left;
      r13label.top:=r12label.top+(ebxlabel.top-eaxlabel.top);
      r13label.Cursor:=eaxlabel.Cursor;
      r13label.Tag:=6413;
      r13label.PopupMenu:=pmRegisters;
      r13label.onclick:=EAXLabelDblClick;
      r13label.OnMouseDown:=RegisterMouseDown;
    end;

    if r14label=nil then
    begin
      r14label:=tlabel.create(self);
      r14label.parent:=scrollbox1;
      r14label.Font:=eaxlabel.Font;
      r14label.left:=eaxlabel.left;
      r14label.top:=r13label.top+(ebxlabel.top-eaxlabel.top);
      r14label.Cursor:=eaxlabel.Cursor;
      r14label.Tag:=6414;
      r14label.PopupMenu:=pmRegisters;
      r14label.onclick:=EAXLabelDblClick;
      r14label.OnMouseDown:=RegisterMouseDown;
    end;

    if r15label=nil then
    begin
      r15label:=tlabel.create(self);
      r15label.parent:=scrollbox1;
      r15label.Font:=eaxlabel.Font;
      r15label.left:=eaxlabel.left;
      r15label.top:=r14label.top+(ebxlabel.top-eaxlabel.top);
      r15label.Cursor:=eaxlabel.Cursor;
      r15label.Tag:=6415;
      r15label.PopupMenu:=pmRegisters;
      r15label.onclick:=EAXLabelDblClick;
      r15label.OnMouseDown:=RegisterMouseDown;
    end;

    if processhandler.SystemArchitecture=archX86 then
      eiplabel.top:=r15label.top+(ebxlabel.top-eaxlabel.top)
    else
      eiplabel.top:=r14label.top+(ebxlabel.top-eaxlabel.top);

    label16.top:=eiplabel.top+(ebxlabel.top-eaxlabel.top);
    Shape3.top:=label16.top+(ebxlabel.top-eaxlabel.top);
    CSLabel.top:=shape3.top+shape3.height+2;
    SSLabel.top:=CSLabel.top+(ebxlabel.top-eaxlabel.top);
    DSLabel.top:=SSLabel.top+(ebxlabel.top-eaxlabel.top);
    ESLabel.top:=DSLabel.top+(ebxlabel.top-eaxlabel.top);
    FSLabel.top:=ESLabel.top+(ebxlabel.top-eaxlabel.top);
    GSLabel.top:=FSLabel.top+(ebxlabel.top-eaxlabel.top);
  end
  else
  begin
    regstart:='E';
    charcount:=8;

    eiplabel.top:=esplabel.top+(ebxlabel.top-eaxlabel.top);
    label16.top:=eiplabel.top+(ebxlabel.top-eaxlabel.top);
    Shape3.top:=label16.top+(ebxlabel.top-eaxlabel.top);
    CSLabel.top:=shape3.top+shape3.height+2;
    SSLabel.top:=CSLabel.top+(ebxlabel.top-eaxlabel.top);
    DSLabel.top:=SSLabel.top+(ebxlabel.top-eaxlabel.top);
    ESLabel.top:=DSLabel.top+(ebxlabel.top-eaxlabel.top);
    FSLabel.top:=ESLabel.top+(ebxlabel.top-eaxlabel.top);
    GSLabel.top:=FSLabel.top+(ebxlabel.top-eaxlabel.top);

  end;

  if r8label<>nil then r8label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r9label<>nil then r9label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r10label<>nil then r10label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r11label<>nil then r11label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r12label<>nil then r12label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r13label<>nil then r13label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r14label<>nil then r14label.visible:=processhandler.is64Bit or (processhandler.SystemArchitecture=archArm);
  if r15label<>nil then r15label.visible:=processhandler.is64Bit;

  scrollbox1.OnResize(scrollbox1);

  run1.Enabled:=true;
  step1.Enabled:=true;
  stepover1.Enabled:=true;
  runtill1.Enabled:=true;
  stacktrace1.Enabled:=true;
  Executetillreturn1.Enabled:=true;

  caption:=Format(rsMemoryViewerCurrentlyDebuggingThread, [inttohex(threadid, 1)]);

  if frmstacktrace<>nil then
    frmstacktrace.stacktrace(threadhandle, lastdebugcontext);

  if processhandler.SystemArchitecture=archX86 then
    disassemblerview.SelectedAddress:=lastdebugcontext.{$ifdef CPU64}rip{$else}eip{$endif}
  else
  if processhandler.SystemArchitecture=archArm then
    disassemblerview.SelectedAddress:=lastdebugcontextarm.PC;



  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'AX '+IntToHex(lastdebugcontext.{$ifdef CPU64}rax{$else}eax{$endif},charcount)
  else
    temp:=' R0 '+IntToHex(lastdebugcontextarm.R0,charcount);
  if temp<>eaxlabel.Caption then
  begin
    eaxlabel.Font.Color:=clred;
    eaxlabel.Caption:=temp;
  end else eaxlabel.Font.Color:=clWindowText;


  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'BX '+IntToHex(lastdebugcontext.{$ifdef CPU64}rbx{$else}ebx{$endif},charcount)
  else
    temp:=' R1 '+IntToHex(lastdebugcontextarm.R1, charcount);
  if temp<>ebxlabel.Caption then
  begin
    ebxlabel.Font.Color:=clred;
    ebxlabel.Caption:=temp;
  end else ebxlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'CX '+IntToHex(lastdebugcontext.{$ifdef CPU64}rcx{$else}ecx{$endif},charcount)
  else
    temp:=' R2 '+IntToHex(lastdebugcontextarm.R2, charcount);
  if temp<>eCxlabel.Caption then
  begin
    eCXlabel.Font.Color:=clred;
    eCXlabel.Caption:=temp;
  end else eCXlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'DX '+IntToHex(lastdebugcontext.{$ifdef CPU64}rdx{$else}edx{$endif},charcount)
  else
    temp:=' R3 '+IntToHex(lastdebugcontextarm.R3, charcount);
  if temp<>eDxlabel.Caption then
  begin
    eDxlabel.Font.Color:=clred;
    eDxlabel.Caption:=temp;
  end else eDxlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'SI '+IntToHex(lastdebugcontext.{$ifdef CPU64}rsi{$else}esi{$endif},charcount)
  else
    temp:=' R4 '+IntToHex(lastdebugcontextarm.R4, charcount);
  if temp<>eSIlabel.Caption then
  begin
    eSIlabel.Font.Color:=clred;
    eSIlabel.Caption:=temp;
  end else eSIlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'DI '+IntToHex(lastdebugcontext.{$ifdef CPU64}rdi{$else}edi{$endif},charcount)
  else
    temp:=' R5 '+IntToHex(lastdebugcontextarm.R5, charcount);
  if temp<>eDIlabel.Caption then
  begin
    eDIlabel.Font.Color:=clred;
    eDIlabel.Caption:=temp;
  end else eDIlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'BP '+IntToHex(lastdebugcontext.{$ifdef CPU64}rbp{$else}ebp{$endif},charcount)
  else
    temp:=' R6 '+IntToHex(lastdebugcontextarm.R6, charcount);
  if temp<>eBPlabel.Caption then
  begin
    eBPlabel.Font.Color:=clred;
    eBPlabel.Caption:=temp;
  end else eBPlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'SP '+IntToHex(lastdebugcontext.{$ifdef CPU64}rsp{$else}esp{$endif},charcount)
  else
    temp:=' R7 '+IntToHex(lastdebugcontextarm.R3, charcount);
  if temp<>eSPlabel.Caption then
  begin
    eSPlabel.Font.Color:=clred;
    eSPlabel.Caption:=temp;
  end else eSPlabel.Font.Color:=clWindowText;

  if processhandler.SystemArchitecture=archX86 then
    temp:=regstart+'IP '+IntToHex(lastdebugcontext.{$ifdef CPU64}rip{$else}eip{$endif},charcount)
  else
    temp:='PC '+IntToHex(lastdebugcontextarm.PC, charcount);
  if temp<>eIPlabel.Caption then
  begin
    eIPlabel.Font.Color:=clred;
    eIPlabel.Caption:=temp;
  end else eIPlabel.Font.Color:=clWindowText;

  {$ifdef CPU64}
  if processhandler.is64Bit or (processhandler.SystemArchitecture=archArm)  then
  begin
    if processhandler.SystemArchitecture=archX86 then
      temp:=' R8 '+IntToHex(lastdebugcontext.r8,16)
    else
      temp:=' R8 '+IntToHex(lastdebugcontextarm.r8,8);
    if temp<>r8label.Caption then
    begin
      r8label.Font.Color:=clred;
      r8label.Caption:=temp;
    end else r8label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:=' R9 '+IntToHex(lastdebugcontext.r9,16)
    else
      temp:=' R9 '+IntToHex(lastdebugcontextarm.r9,8);
    if temp<>r9label.Caption then
    begin
      r9label.Font.Color:=clred;
      r9label.Caption:=temp;
    end else r9label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:='R10 '+IntToHex(lastdebugcontext.r10,16)
    else
      temp:='R10 '+IntToHex(lastdebugcontextarm.r10,8);
    if temp<>r10label.Caption then
    begin
      r10label.Font.Color:=clred;
      r10label.Caption:=temp;
    end else r10label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:='R11 '+IntToHex(lastdebugcontext.r11,16)
    else
      temp:=' FP '+IntToHex(lastdebugcontextarm.FP,8);
    if temp<>r11label.Caption then
    begin
      r11label.Font.Color:=clred;
      r11label.Caption:=temp;
    end else r11label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:='R12 '+IntToHex(lastdebugcontext.r12,16)
    else
      temp:=' IP '+IntToHex(lastdebugcontextarm.IP,8);
    if temp<>r12label.Caption then
    begin
      r12label.Font.Color:=clred;
      r12label.Caption:=temp;
    end else r12label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:='R13 '+IntToHex(lastdebugcontext.r13,16)
    else
      temp:=' SP '+IntToHex(lastdebugcontextarm.SP,8);
    if temp<>r13label.Caption then
    begin
      r13label.Font.Color:=clred;
      r13label.Caption:=temp;
    end else r13label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
      temp:='R14 '+IntToHex(lastdebugcontext.r14,16)
    else
      temp:=' LR '+IntToHex(lastdebugcontextarm.LR,8);
    if temp<>r14label.Caption then
    begin
      r14label.Font.Color:=clred;
      r14label.Caption:=temp;
    end else r14label.Font.Color:=clWindowText;

    if processhandler.SystemArchitecture=archX86 then
    begin
      temp:='R15 '+IntToHex(lastdebugcontext.r15,16);
      if temp<>r15label.Caption then
      begin
        r15label.Font.Color:=clred;
        r15label.Caption:=temp;
      end else r15label.Font.Color:=clWindowText;
    end;
  end;
  {$endif}

  if processhandler.SystemArchitecture=archX86 then
  begin

    temp:='CS '+IntToHex(lastdebugcontext.SEGCS,4);
    if temp<>CSlabel.Caption then
    begin
      CSlabel.Font.Color:=clred;
      CSlabel.Caption:=temp;
    end else CSlabel.Font.Color:=clWindowText;

    temp:='DS '+IntToHex(lastdebugcontext.SEGDS,4);
    if temp<>DSlabel.Caption then
    begin
      DSlabel.Font.Color:=clred;
      DSlabel.Caption:=temp;
    end else DSLabel.Font.Color:=clWindowText;

    temp:='SS '+IntToHex(lastdebugcontext.SEGSS,4);
    if temp<>SSlabel.Caption then
    begin
      SSlabel.Font.Color:=clred;
      SSlabel.Caption:=temp;
    end else SSlabel.Font.Color:=clWindowText;

    temp:='ES '+IntToHex(lastdebugcontext.SEGES,4);
    if temp<>ESlabel.Caption then
    begin
      ESlabel.Font.Color:=clred;
      ESlabel.Caption:=temp;
    end else ESlabel.Font.Color:=clWindowText;

    temp:='FS '+IntToHex(lastdebugcontext.SEGFS,4);
    if temp<>FSlabel.Caption then
    begin
      FSlabel.Font.Color:=clred;
      FSlabel.Caption:=temp;
    end else FSlabel.Font.Color:=clWindowText;

    temp:='GS '+IntToHex(lastdebugcontext.SEGGS,4);
    if temp<>GSlabel.Caption then
    begin
      GSlabel.Font.Color:=clred;
      GSlabel.Caption:=temp;
    end else GSlabel.Font.Color:=clWindowText;

    temp:='CF '+IntToStr(GetBit(2,lastdebugcontext.EFLAgs));
    if temp<>cflabel.Caption then
    begin
      CFlabel.Font.Color:=clred;
      CFlabel.caption:=temp;
    end else cflabel.Font.Color:=clWindowText;

    temp:='PF '+IntToStr(GetBit(2,lastdebugcontext.EFlags));
    if temp<>Pflabel.Caption then
    begin
      Pflabel.Font.Color:=clred;
      Pflabel.caption:=temp;
    end else Pflabel.Font.Color:=clWindowText;

    temp:='AF '+IntToStr(GetBit(4,lastdebugcontext.EFlags));
    if temp<>Aflabel.Caption then
    begin
      Aflabel.Font.Color:=clred;
      Aflabel.caption:=temp;
    end else Aflabel.Font.Color:=clWindowText;

    temp:='ZF '+IntToStr(GetBit(6,lastdebugcontext.EFlags));
    if temp<>Zflabel.Caption then
    begin
      Zflabel.Font.Color:=clred;
      Zflabel.caption:=temp;
    end else Zflabel.Font.Color:=clWindowText;

    temp:='SF '+IntToStr(GetBit(7,lastdebugcontext.EFlags));
    if temp<>Sflabel.Caption then
    begin
      Sflabel.Font.Color:=clred;
      Sflabel.caption:=temp;
    end else Sflabel.Font.Color:=clWindowText;

    temp:='DF '+IntToStr(GetBit(10,lastdebugcontext.EFlags));
    if temp<>Dflabel.Caption then
    begin
      Dflabel.Font.Color:=clred;
      Dflabel.caption:=temp;
    end else Dflabel.Font.Color:=clWindowText;

    temp:='OF '+IntToStr(GetBit(11,lastdebugcontext.EFlags));
    if temp<>Oflabel.Caption then
    begin
      Oflabel.Font.Color:=clred;
      Oflabel.caption:=temp;
    end else Oflabel.Font.Color:=clWindowText;

    Label15.left:=eaxlabel.left+eaxlabel.Canvas.TextWidth(eaxlabel.caption)+16;
    shape2.left:=Label15.left;
    cflabel.left:=label15.left;
    pflabel.left:=label15.left;
    aflabel.left:=label15.left;
    zflabel.left:=label15.left;
    sflabel.left:=label15.left;
    dflabel.left:=label15.left;
    oflabel.left:=label15.left;
  end
  else
  begin
    //arm
    Label15.visible:=false;
    shape2.visible:=false;
    cflabel.visible:=false;
    pflabel.visible:=false;
    aflabel.visible:=false;
    zflabel.visible:=false;
    sflabel.visible:=false;
    dflabel.visible:=false;
    oflabel.visible:=false;

    Label16.visible:=false;
    shape3.visible:=false;

    cslabel.caption:='CSPR='+inttohex(lastdebugcontextarm.CPSR,8);
    sslabel.visible:=false;
    dslabel.visible:=false;
    eslabel.visible:=false;
    fslabel.visible:=false;
    gslabel.visible:=false;
  end;




  sbShowFloats.BringToFront;
  //sbShowFloats.visible:=true;

  if not registerview.visible then
  begin
    setShowDebugPanels(true);

    {registerview.visible:=true;
    splitter2.visible:=true;

    pnlStacktrace.Visible:=true;
    splitter3.Visible:=true;

    //first time show  }

    registerview.ClientWidth:=label15.left+label15.width+16+scrollbox1.VertScrollBar.Size;

    scrollbox1.HorzScrollBar.Visible:=false;




    scrollbox1.Invalidate;
    ScrollBox1Resize(scrollbox1);


  end;

  if laststack=nil then
    getmem(laststack,stacktraceSize);

  //get a stackview
  i:=0;
  stackaddress:=lastdebugcontext.{$ifdef cpu64}rsp{$else}esp{$endif};
  while i<stacktracesize do
  begin
    bs:=4096-((stackaddress+i) mod 4096);
    bs:=min(stacktraceSize-i, bs);


    readprocessmemory(processhandle, pointer(stackaddress+i), pointer(ptruint(laststack)+i), bs, x);

    inc(i,bs);
  end;


  reloadStacktrace;

  if frmFloatingPointPanel<>nil then
    frmFloatingPointPanel.SetContextPointer(@lastdebugcontext);

  if not memorybrowser.Visible then
    memorybrowser.show;
end;

initialization
  MemoryBrowsers:=TList.Create;

  {$i MemoryBrowserFormUnit.lrs}

finalization
  if MemoryBrowsers<>nil then
    FreeAndNil(MemoryBrowsers);


end.
