# Bash Script - Frontend Folder Structure

This is a bash script to create a custom folder structure for medium/larger react ts projects. It tries to keep a clean architecture for frontend development.

There are several scripts depending on how big your project will be. Small, medium, and large. Together with them, we have something in between mid/large named midLarge.

Apart from that, I've created a simple menu to allow you pick the right choice. For doing so, you need to follow the steps below.

Once executed, just follow the steps prompted in your terminal.

## How to use it?

After clone it, give it execution permissions with chmod +x

```sh
chmod +x front_init.sh
```

After doing so, you can create an alias or add it to your binaries for easing execution from any folder

```sh
sudo mv front_init.sh /usr/local/bin/front_init
```

For execution you should just "call it" within your workspace directory (example below presumes that your alias is the same as the script filename)

```sh
front_init
```

In case, you prefer to set an alias (change .bashrc to .zshrc in case your terminal is a ZSH) Be aware that /path/to/ needs to be modified according to your local routes and preferences

```sh
nano ~/.bashrc
```

alias front_init="~/path/to/front_init.sh"
You can rename front_init alias for the one more convenient to you.

```sh
source ~/.bashrc
```

*Happy hacking!!*

### What would I find? - example of large script

📁 pages/
Purpose: Top-level route views in your application (e.g., /login, /dashboard, etc.)

__tests__/: Unit or integration tests for full page components.

📁 features/
Purpose: Grouped by domain or business feature (modular structure).

auth/: All authentication-related logic and UI.

components/: Reusable components (e.g., LoginForm, AuthGuard).

hooks/: Feature-specific custom hooks (e.g., useLogin, useAuthCheck).

services/: Functions to call APIs or perform side effects (e.g., loginUser(), fetchSession()).

context/: React Contexts for auth state.

helpers/: Utility functions only used by this feature (e.g., formatAuthError()).

types/: Feature-specific TypeScript interfaces and types.

__tests__/: Unit tests scoped to the auth feature.

✅ You can create other feature folders (e.g., chat/, profile/) following the same layout.

📁 shared/
Purpose: Common utilities and resources shared across features/pages.

lib/: Low-level libraries and helpers (e.g., date functions, formatting).

__tests__/: Tests for lib/.

utils/: Global utility functions (e.g., debounce, cloneDeep).

__tests__/: Tests for utils/.

types/: Global TypeScript types used throughout the app (e.g., User, ApiResponse).

services/: Global services that aren't tied to a single feature (e.g., axiosClient, authHeader).

__tests__/: Tests for global services.

routes/: Centralized route configuration (e.g., React Router declarations).

context/: Global contexts (e.g., ThemeContext, ToastContext).

__tests__/: Context tests.

hooks/: Global reusable hooks (e.g., useWindowSize, useDarkMode).

__tests__/: Tests for shared hooks.

hoc/: Higher-Order Components (e.g., withAuth, withErrorBoundary).

__tests__/: Tests for HOCs.

globalStore/: Global state managers (e.g., Zustand, Redux slices, Recoil).

__tests__/: Tests for global store logic.

config/: App-wide configuration files (e.g., API URLs, environment variables).

components/: Highly reusable presentational components (e.g., Modal, Button, Spinner).

__tests__/: Tests for shared components.

📁 theme/
Purpose: Styling, layout components, and design system elements.

layout/: Structural layout elements (e.g., Navbar, Sidebar, Footer).

__tests__/: Tests for layout components.

templates/: Layout or UI templates like modals, toasts, form templates.

modals/: Reusable modal templates.

toasts/: Toast notifications.

forms/: Prebuilt form layouts (e.g., FormWrapper, FormGroup).

__tests__/: Tests for templates.

styles/: Global SCSS/CSS files, variables, themes.

ui/: Atomic UI components (e.g., Button, Input, Dropdown, Card).

buttons/: Button variations (e.g., IconButton, SubmitButton).

dropdowns/: Reusable dropdown components.

__tests__/: Tests for UI components.
