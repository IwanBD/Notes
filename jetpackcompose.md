# Jetpack Compose Cheat Sheet

## Basic Structure

### Composable Function
```kotlin
@Composable
fun MyComposable() {
    // UI elements go here
}
```

### Preview
```kotlin
@Preview(showBackground = true, widthDp = 320, heightDp = 640)
@Composable
fun MyComposablePreview() {
    MyAppTheme {
        MyComposable()
    }
}
```

### Compose Entry Point (Activity)
```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyAppTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    MyApp()
                }
            }
        }
    }
}
```

## Core Components

### Text
```kotlin
Text(
    text = "Hello Compose",
    color = Color.Blue,
    fontSize = 16.sp,
    fontWeight = FontWeight.Bold,
    textAlign = TextAlign.Center,
    lineHeight = 24.sp,
    overflow = TextOverflow.Ellipsis,
    maxLines = 2,
    modifier = Modifier.padding(16.dp)
)
```

### Button
```kotlin
Button(
    onClick = { /* action */ },
    enabled = true,
    colors = ButtonDefaults.buttonColors(
        containerColor = MaterialTheme.colorScheme.primary
    ),
    shape = RoundedCornerShape(8.dp),
    contentPadding = PaddingValues(16.dp),
    modifier = Modifier.padding(8.dp)
) {
    Text("Click Me")
}
```

### Icon Button
```kotlin
IconButton(
    onClick = { /* action */ },
    modifier = Modifier.size(48.dp)
) {
    Icon(
        Icons.Filled.Favorite,
        contentDescription = "Favorite",
        tint = Color.Red
    )
}
```

### Image
```kotlin
// From resource
Image(
    painter = painterResource(id = R.drawable.image),
    contentDescription = "Image description",
    contentScale = ContentScale.Crop,
    modifier = Modifier
        .size(200.dp)
        .clip(CircleShape)
)

// From URL (using Coil)
AsyncImage(
    model = ImageRequest.Builder(LocalContext.current)
        .data("https://example.com/image.jpg")
        .crossfade(true)
        .build(),
    contentDescription = "Image from URL",
    contentScale = ContentScale.Crop,
    modifier = Modifier.size(200.dp)
)
```

### TextField
```kotlin
// Basic TextField
var text by remember { mutableStateOf("") }
TextField(
    value = text,
    onValueChange = { text = it },
    label = { Text("Label") },
    placeholder = { Text("Placeholder") },
    singleLine = true,
    maxLines = 1
)

// Outlined TextField
OutlinedTextField(
    value = text,
    onValueChange = { text = it },
    label = { Text("Email") },
    leadingIcon = { Icon(Icons.Filled.Email, contentDescription = "Email") },
    keyboardOptions = KeyboardOptions(
        keyboardType = KeyboardType.Email,
        imeAction = ImeAction.Next
    ),
    keyboardActions = KeyboardActions(
        onNext = { /* handle next */ }
    ),
    isError = !text.contains("@"),
    modifier = Modifier.fillMaxWidth()
)
```

### Checkbox
```kotlin
var checked by remember { mutableStateOf(false) }
Row(
    verticalAlignment = Alignment.CenterVertically,
    modifier = Modifier.padding(8.dp)
) {
    Checkbox(
        checked = checked,
        onCheckedChange = { checked = it },
        colors = CheckboxDefaults.colors(
            checkedColor = MaterialTheme.colorScheme.primary
        )
    )
    Spacer(modifier = Modifier.width(8.dp))
    Text("Check me")
}
```

### Radio Button
```kotlin
val radioOptions = listOf("Option 1", "Option 2", "Option 3")
var selectedOption by remember { mutableStateOf(radioOptions[0]) }

Column {
    radioOptions.forEach { option ->
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .fillMaxWidth()
                .selectable(
                    selected = (option == selectedOption),
                    onClick = { selectedOption = option }
                )
                .padding(8.dp)
        ) {
            RadioButton(
                selected = (option == selectedOption),
                onClick = { selectedOption = option }
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(text = option)
        }
    }
}
```

### Switch
```kotlin
var switchState by remember { mutableStateOf(false) }
Row(
    verticalAlignment = Alignment.CenterVertically,
    horizontalArrangement = Arrangement.spacedBy(8.dp)
) {
    Switch(
        checked = switchState,
        onCheckedChange = { switchState = it },
        colors = SwitchDefaults.colors(
            checkedThumbColor = MaterialTheme.colorScheme.primary
        )
    )
    Text("Enable feature")
}
```

### Slider
```kotlin
var sliderValue by remember { mutableStateOf(0f) }
Column {
    Slider(
        value = sliderValue,
        onValueChange = { sliderValue = it },
        valueRange = 0f..100f,
        steps = 10,
        modifier = Modifier.padding(16.dp)
    )
    Text("Value: ${sliderValue.toInt()}")
}
```

## Layout Components

### Box
```kotlin
Box(
    contentAlignment = Alignment.Center,
    modifier = Modifier
        .size(100.dp)
        .background(Color.LightGray)
) {
    Text("Centered")
    Box(
        Modifier
            .align(Alignment.TopEnd)
            .size(20.dp)
            .background(Color.Red)
    )
}
```

### Row
```kotlin
Row(
    horizontalArrangement = Arrangement.SpaceBetween,
    verticalAlignment = Alignment.CenterVertically,
    modifier = Modifier
        .fillMaxWidth()
        .padding(16.dp)
) {
    Text("Left")
    Text("Center")
    Text("Right")
}
```

### Column
```kotlin
Column(
    verticalArrangement = Arrangement.spacedBy(8.dp),
    horizontalAlignment = Alignment.CenterHorizontally,
    modifier = Modifier.padding(16.dp)
) {
    Text("Top")
    Text("Middle")
    Text("Bottom")
}
```

### Spacer
```kotlin
Column {
    Text("Item 1")
    Spacer(modifier = Modifier.height(16.dp))
    Text("Item 2")
}

Row {
    Text("Left")
    Spacer(modifier = Modifier.width(16.dp))
    Text("Right")
}
```

### Divider
```kotlin
Column {
    Text("Above divider")
    Divider(
        thickness = 1.dp,
        color = Color.Gray,
        modifier = Modifier.padding(vertical = 8.dp)
    )
    Text("Below divider")
}
```

### LazyColumn (RecyclerView equivalent)
```kotlin
LazyColumn {
    item {
        Text("Header", fontWeight = FontWeight.Bold)
    }
    
    items(itemsList) { item ->
        ItemRow(item)
    }
    
    itemsIndexed(itemsList) { index, item ->
        ItemRowWithIndex(index, item)
    }
}
```

### LazyRow (Horizontal list)
```kotlin
LazyRow(
    horizontalArrangement = Arrangement.spacedBy(8.dp),
    contentPadding = PaddingValues(horizontal = 16.dp)
) {
    items(horizontalItems) { item ->
        ItemCard(item)
    }
}
```

### LazyVerticalGrid
```kotlin
LazyVerticalGrid(
    columns = GridCells.Fixed(2),
    contentPadding = PaddingValues(8.dp),
    horizontalArrangement = Arrangement.spacedBy(8.dp),
    verticalArrangement = Arrangement.spacedBy(8.dp)
) {
    items(gridItems) { item ->
        GridItem(item)
    }
}
```

## State Management

### Remember
```kotlin
// Simple state
var counter by remember { mutableStateOf(0) }

// Multiple states
val (name, setName) = remember { mutableStateOf("") }
val (age, setAge) = remember { mutableStateOf(0) }

// Remember based on calculations
val formattedCounter = remember(counter) {
    "Count: $counter"
}
```

### RememberSaveable (survives configuration changes)
```kotlin
var text by rememberSaveable { mutableStateOf("") }

// With custom Saver
data class City(val name: String, val country: String)

val CitySaver = Saver<City, Bundle>(
    save = { city -> Bundle().apply {
        putString("name", city.name)
        putString("country", city.country)
    }},
    restore = { bundle -> 
        City(
            bundle.getString("name", ""),
            bundle.getString("country", "")
        )
    }
)

var city by rememberSaveable(stateSaver = CitySaver) {
    mutableStateOf(City("Paris", "France"))
}
```

### State Hoisting
```kotlin
// Parent component
@Composable
fun CounterScreen() {
    var count by remember { mutableStateOf(0) }
    
    Column {
        Text("Count: $count")
        CounterButton(
            count = count,
            onIncrement = { count++ }
        )
    }
}

// Child component with hoisted state
@Composable
fun CounterButton(
    count: Int,
    onIncrement: () -> Unit
) {
    Button(onClick = onIncrement) {
        Text("Increment ($count)")
    }
}
```

## Side Effects

### LaunchedEffect
```kotlin
// Run once when key changes
LaunchedEffect(key1 = userId) {
    val userData = fetchUserData(userId)
    // Process user data
}

// Run on every recomposition
LaunchedEffect(Unit) {
    // Runs once when the composable enters composition
}

// Multiple keys
LaunchedEffect(key1 = userId, key2 = refreshTrigger) {
    // Runs when either userId or refreshTrigger changes
}
```

### DisposableEffect
```kotlin
DisposableEffect(key1 = lifecycleOwner) {
    val observer = LifecycleEventObserver { _, event ->
        if (event == Lifecycle.Event.ON_PAUSE) {
            // Do something when paused
        }
    }
    
    lifecycleOwner.lifecycle.addObserver(observer)
    
    onDispose {
        lifecycleOwner.lifecycle.removeObserver(observer)
    }
}
```

### SideEffect
```kotlin
SideEffect {
    // Runs on every successful recomposition
    analyticsTracker.trackScreen("MyScreen")
}
```

### produceState
```kotlin
val userState = produceState<Result<User>>(initialValue = Result.Loading) {
    value = Result.Loading
    try {
        val user = userRepository.getUser(userId)
        value = Result.Success(user)
    } catch (e: Exception) {
        value = Result.Error(e)
    }
}

when (val state = userState.value) {
    is Result.Loading -> LoadingIndicator()
    is Result.Success -> UserProfile(state.data)
    is Result.Error -> ErrorMessage(state.exception)
}
```

### derivedStateOf
```kotlin
val names = remember { mutableStateListOf("John", "Mary", "Bob") }
val sortedNames = remember { derivedStateOf { names.sorted() } }

// sortedNames.value will be recalculated only when names changes
```

## Navigation

### Basic Navigation Setup
```kotlin
@Composable
fun AppNavHost(
    navController: NavHostController = rememberNavController(),
    startDestination: String = "home"
) {
    NavHost(
        navController = navController,
        startDestination = startDestination
    ) {
        composable("home") {
            HomeScreen(
                onNavigateToDetails = { itemId ->
                    navController.navigate("details/$itemId")
                }
            )
        }
        
        composable(
            route = "details/{itemId}",
            arguments = listOf(
                navArgument("itemId") { type = NavType.IntType }
            )
        ) { backStackEntry ->
            val itemId = backStackEntry.arguments?.getInt("itemId") ?: 0
            DetailsScreen(
                itemId = itemId,
                onBack = { navController.popBackStack() }
            )
        }
    }
}
```

### Passing Arguments
```kotlin
// With arguments
navController.navigate("profile/${user.id}")

// With query parameters
navController.navigate("search?query=$searchTerm")

// With options
navController.navigate("settings") {
    popUpTo("home") { inclusive = true }
    launchSingleTop = true
    restoreState = true
}
```

### Retrieving Arguments
```kotlin
@Composable
fun ProfileScreen(navController: NavController) {
    val userId = navController.currentBackStackEntry?.arguments?.getInt("userId") ?: 0
    // Use userId
}
```

## Modifiers

### Basic Modifiers
```kotlin
Modifier
    .size(width = 100.dp, height = 50.dp)
    .padding(all = 16.dp)
    .padding(horizontal = 8.dp, vertical = 16.dp)
    .padding(start = 8.dp, top = 16.dp, end = 8.dp, bottom = 16.dp)
    .offset(x = 4.dp, y = 8.dp)
    .fillMaxWidth()
    .fillMaxHeight(0.5f)
    .fillMaxSize()
    .width(100.dp)
    .height(IntrinsicSize.Min)
    .wrapContentHeight()
    .wrapContentWidth()
    .defaultMinSize(minWidth = 100.dp, minHeight = 50.dp)
```

### Visual Modifiers
```kotlin
Modifier
    .background(Color.Blue)
    .background(
        brush = Brush.linearGradient(
            colors = listOf(Color.Red, Color.Blue),
            start = Offset(0f, 0f),
            end = Offset(100f, 100f)
        )
    )
    .clip(RoundedCornerShape(8.dp))
    .clip(CircleShape)
    .alpha(0.5f)
    .shadow(elevation = 4.dp, shape = RoundedCornerShape(8.dp))
    .border(width = 1.dp, color = Color.Gray, shape = RoundedCornerShape(4.dp))
```

### Layout Modifiers
```kotlin
Modifier
    .aspectRatio(16f / 9f)
    .requiredWidth(100.dp)
    .requiredHeight(50.dp)
    .weight(1f)
    .align(Alignment.CenterHorizontally)
    .align(Alignment.BottomEnd)
```

### Interactive Modifiers
```kotlin
Modifier
    .clickable { /* handle click */ }
    .combinedClickable(
        onClick = { /* handle click */ },
        onLongClick = { /* handle long click */ },
        onDoubleClick = { /* handle double click */ }
    )
    .draggable(
        state = rememberDraggableState { /* handle delta */ },
        orientation = Orientation.Horizontal
    )
    .pointerInput(Unit) {
        detectTapGestures(
            onPress = { /* handle press */ },
            onDoubleTap = { /* handle double tap */ },
            onLongPress = { /* handle long press */ },
            onTap = { /* handle tap */ }
        )
    }
    .scrollable(
        state = rememberScrollableState { /* handle delta */ },
        orientation = Orientation.Vertical
    )
```

### Semantic Modifiers
```kotlin
Modifier
    .semantics {
        contentDescription = "Profile picture"
        heading()
        disabled()
    }
    .testTag("profile_picture")
```

### Combining Modifiers
```kotlin
// Order matters!
Modifier
    .clickable { /* handle click */ } // Applied first
    .padding(16.dp) // Applied second (padding doesn't affect clickable area)

// vs

Modifier
    .padding(16.dp) // Applied first
    .clickable { /* handle click */ } // Applied second (clickable area is smaller)
```

## Theming

### MaterialTheme Setup
```kotlin
@Composable
fun MyAppTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context)
            else dynamicLightColorScheme(context)
        }
        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }
    
    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        shapes = Shapes,
        content = content
    )
}
```

### Custom Colors
```kotlin
private val LightColorScheme = lightColorScheme(
    primary = Purple40,
    secondary = PurpleGrey40,
    tertiary = Pink40,
    background = Color(0xFFFFFBFE),
    surface = Color(0xFFFFFBFE),
    onPrimary = Color.White,
    onSecondary = Color.White,
    onTertiary = Color.White,
    onBackground = Color(0xFF1C1B1F),
    onSurface = Color(0xFF1C1B1F),
)
```

### Using Theme Properties
```kotlin
Text(
    text = "Themed Text",
    style = MaterialTheme.typography.bodyLarge,
    color = MaterialTheme.colorScheme.primary
)

Surface(
    color = MaterialTheme.colorScheme.surface,
    tonalElevation = 2.dp,
    shape = MaterialTheme.shapes.medium
) {
    // Content
}
```

### Custom Typography
```kotlin
val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        lineHeight = 24.sp,
        letterSpacing = 0.5.sp
    ),
    titleLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 22.sp,
        lineHeight = 28.sp,
        letterSpacing = 0.sp
    ),
    // Add other styles
)
```

### Custom Shapes
```kotlin
val Shapes = Shapes(
    small = RoundedCornerShape(4.dp),
    medium = RoundedCornerShape(8.dp),
    large = RoundedCornerShape(16.dp)
)
```

## Animation

### Basic Animation
```kotlin
var expanded by remember { mutableStateOf(false) }
val size by animateDpAsState(
    targetValue = if (expanded) 200.dp else 100.dp,
    animationSpec = spring(
        dampingRatio = Spring.DampingRatioMediumBouncy,
        stiffness = Spring.StiffnessLow
    )
)

Box(
    modifier = Modifier
        .size(size)
        .background(Color.Blue)
        .clickable { expanded = !expanded }
)
```

### Animated Visibility
```kotlin
var visible by remember { mutableStateOf(true) }

AnimatedVisibility(
    visible = visible,
    enter = fadeIn() + slideInVertically(),
    exit = fadeOut() + slideOutVertically()
) {
    Text("Animated text")
}
```

### Animated Content
```kotlin
var state by remember { mutableStateOf(true) }

AnimatedContent(
    targetState = state,
    transitionSpec = {
        fadeIn() + slideInVertically() with 
        fadeOut() + slideOutVertically()
    }
) { targetState ->
    if (targetState) {
        Text("State A")
    } else {
        Text("State B")
    }
}
```

### Animate Color Change
```kotlin
var isSelected by remember { mutableStateOf(false) }
val backgroundColor by animateColorAsState(
    targetValue = if (isSelected) Color.Blue else Color.Gray
)

Box(
    modifier = Modifier
        .size(100.dp)
        .background(backgroundColor)
        .clickable { isSelected = !isSelected }
)
```

### Animate Multiple Values
```kotlin
var expanded by remember { mutableStateOf(false) }

val transition = updateTransition(expanded, label = "expandTransition")
val size by transition.animateDp(label = "size") { isExpanded ->
    if (isExpanded) 200.dp else 100.dp
}
val corner by transition.animateDp(label = "corner") { isExpanded ->
    if (isExpanded) 0.dp else 16.dp
}
val color by transition.animateColor(label = "color") { isExpanded ->
    if (isExpanded) Color.Red else Color.Blue
}

Box(
    modifier = Modifier
        .size(size)
        .clip(RoundedCornerShape(corner))
        .background(color)
        .clickable { expanded = !expanded }
)
```

### Infinite Animation
```kotlin
val infiniteTransition = rememberInfiniteTransition(label = "infinite")
val color by infiniteTransition.animateColor(
    initialValue = Color.Red,
    targetValue = Color.Blue,
    animationSpec = infiniteRepeatable(
        animation = tween(1000),
        repeatMode = RepeatMode.Reverse
    ),
    label = "color"
)

Box(
    modifier = Modifier
        .size(100.dp)
        .background(color)
)
```

## Material Components

### Card
```kotlin
Card(
    colors = CardDefaults.cardColors(
        containerColor = MaterialTheme.colorScheme.surfaceVariant,
    ),
    shape = RoundedCornerShape(16.dp),
    elevation = CardDefaults.cardElevation(
        defaultElevation = 4.dp
    ),
    modifier = Modifier.padding(16.dp)
) {
    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        Text("Card Title", style = MaterialTheme.typography.titleLarge)
        Spacer(modifier = Modifier.height(8.dp))
        Text("Card content goes here")
    }
}
```

### Floating Action Button
```kotlin
FloatingActionButton(
    onClick = { /* action */ },
    containerColor = MaterialTheme.colorScheme.primary,
    contentColor = MaterialTheme.colorScheme.onPrimary,
    shape = CircleShape
) {
    Icon(Icons.Filled.Add, contentDescription = "Add")
}

// Extended FAB
ExtendedFloatingActionButton(
    onClick = { /* action */ },
    icon = { Icon(Icons.Filled.Add, contentDescription = null) },
    text = { Text("Create") },
    expanded = expanded
)
```

### Top App Bar
```kotlin
Scaffold(
    topBar = {
        TopAppBar(
            title = { Text("My App") },
            navigationIcon = {
                IconButton(onClick = { /* handle back */ }) {
                    Icon(Icons.Filled.ArrowBack, contentDescription = "Back")
                }
            },
            actions = {
                IconButton(onClick = { /* handle search */ }) {
                    Icon(Icons.Filled.Search, contentDescription = "Search")
                }
                IconButton(onClick = { /* handle more */ }) {
                    Icon(Icons.Filled.MoreVert, contentDescription = "More")
                }
            },
            colors = TopAppBarDefaults.topAppBarColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        )
    }
) { innerPadding ->
    // Content with padding
    Box(modifier = Modifier.padding(innerPadding)) {
        // Screen content
    }
}
```

### Bottom Navigation
```kotlin
val navItems = listOf("Home", "Search", "Profile")
var selectedItem by remember { mutableStateOf(0) }

Scaffold(
    bottomBar = {
        NavigationBar {
            navItems.forEachIndexed { index, item ->
                NavigationBarItem(
                    icon = {
                        when (index) {
                            0 -> Icon(Icons.Filled.Home, contentDescription = item)
                            1 -> Icon(Icons.Filled.Search, contentDescription = item)
                            2 -> Icon(Icons.Filled.Person, contentDescription = item)
                        }
                    },
                    label = { Text(item) },
                    selected = selectedItem == index,
                    onClick = { selectedItem = index }
                )
            }
        }
    }
) { innerPadding ->
    // Content with padding
    Box(modifier = Modifier.padding(innerPadding)) {
        // Screen content
    }
}
```

### Tabs
```kotlin
val tabTitles = listOf("Tab 1", "Tab 2", "Tab 3")
var selectedTabIndex by remember { mutableStateOf(0) }

Column {
    TabRow(selectedTabIndex = selectedTabIndex) {
        tabTitles.forEachIndexed { index, title ->
            Tab(
                selected = selectedTabIndex == index,
                onClick = { selectedTabIndex = index },
                text = { Text(title) }
            )
        }
    }
    
    when (selectedTabIndex) {
        0 -> TabContent1()
        1 -> TabContent2()
        2 -> TabContent3()
    }
}
```

### Dialog
```kotlin
var showDialog by remember { mutableStateOf(false) }

Button(onClick = { showDialog = true }) {
    Text("Show Dialog")
}

if (showDialog) {
    AlertDialog(
        onDismissRequest = { showDialog = false },
        title = { Text("Dialog Title") },
        text = { Text("This is the dialog content") },
        confirmButton = {
            TextButton(
                onClick = {
                    // Handle confirm
                    showDialog = false
                }
            ) {
                Text("Confirm")
            }
        },
        dismissButton = {
            TextButton(
                onClick = { showDialog = false }
            ) {
                Text("Dismiss")
            }
        }
    )
}
```

### Bottom Sheet
```kotlin
val sheetState = rememberModalBottomSheetState()
var showBottomSheet by remember { mutableStateOf(false) }

Button(onClick = { showBottomSheet = true }) {
    Text("Show Bottom Sheet")
}

if (showBottomSheet) {
    ModalBottomSheet(
        onDismissRequest = { showBottomSheet = false },
        sheetState = sheetState
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text("Bottom Sheet Title", style = MaterialTheme.typography.titleLarge)
            Spacer(modifier = Modifier.height(16.dp))
            Text("Content goes here...")
            Spacer(modifier = Modifier.height(16.dp))
            Button(
                onClick = { showBottomSheet = false },
                modifier = Modifier.align(Alignment.End)
            ) {
                Text("Close")
            }
        }
    }
}
```

### SnackBar
```kotlin
val snackbarHostState = remember { SnackbarHostState() }
val scope = rememberCoroutineScope()

Scaffold(
    snackbarHost = { SnackbarHost(snackbarHostState) }
) { innerPadding ->
    Column(
        modifier = Modifier
            .padding(innerPadding)
            .padding(16.dp)
    ) {
        Button(
            onClick = {
                scope.launch {
                    val result = snackbarHostState.showSnackbar(
                        message = "This is a snackbar",
                        actionLabel = "Undo",
                        duration = SnackbarDuration.Short
                    )
                    when (result) {
                        SnackbarResult.ActionPerformed -> {
                            // Handle action
                        }
                        SnackbarResult.Dismissed -> {
                            // Handle dismissal
                        }
                    }
                }
            }
        ) {
            Text("Show Snackbar")
        }
    }
}
```

## Permissions and System UI

### Request Permission
```kotlin
val permissionState = rememberPermissionState(
    permission = Manifest.permission.CAMERA
)

Column {
    val textToShow = if (permissionState.hasPermission) {
        "Camera permission granted"
    } else {
        "Camera permission required"
    }
    
    Text(textToShow)
    Button(onClick = { permissionState.launchPermissionRequest() }) {
        Text("Request permission")
    }
}
```

### Handle System UI
```kotlin
val systemUiController = rememberSystemUiController()
val isDarkTheme = isSystemInDarkTheme()

DisposableEffect(systemUiController, isDarkTheme) {
    // Set status bar color
    systemUiController.setStatusBarColor(
        color = Color.Transparent,
        darkIcons = !isDarkTheme
    )
    
    // Set navigation bar color
    systemUiController.setNavigationBarColor(
        color = Color.Transparent,
        darkIcons = !isDarkTheme
    )
    
    onDispose {}
}
```

## Custom Composables

### Creating a Reusable Button
```kotlin
@Composable
fun PrimaryButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true
) {
    Button(
        onClick = onClick,
        modifier = modifier,
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = MaterialTheme.colorScheme.primary,
            contentColor = MaterialTheme.colorScheme.onPrimary,
            disabledContainerColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.38f),
            disabledContentColor = MaterialTheme.colorScheme.onPrimary.copy(alpha = 0.38f)
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Text(text)
    }
}
```

### Creating a Loading State
```kotlin
@Composable
fun LoadingState(
    isLoading: Boolean,
    content: @Composable () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize
