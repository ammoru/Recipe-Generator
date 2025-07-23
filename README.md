# Recipe Generator

A modern, responsive recipe generator built with React, Vite, and Tailwind CSS. Generate delicious recipes based on your available ingredients with a beautiful, animated user interface.

## 🚀 Features

- **Smart Recipe Generation**: Enter your ingredients and get customized recipes
- **Modern UI**: Beautiful interface with Tailwind CSS and Framer Motion animations
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Fast Performance**: Built with Vite for lightning-fast development and builds
- **Multiple Deployment Options**: Ready for GitHub Pages, Vercel, and other platforms

## 🛠️ Tech Stack

- **Frontend**: React 19.1.0
- **Build Tool**: Vite 6.0.7
- **Styling**: Tailwind CSS v4 (latest)
- **Animations**: Framer Motion 12.23.6
- **Code Quality**: ESLint, Prettier
- **Deployment**: GitHub Pages, Vercel

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Recipe-Generator.git
   cd Recipe-Generator
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

## 🚦 Available Scripts

### Development
- `npm run dev` - Start development server
- `npm run preview` - Preview production build locally

### Building
- `npm run build` - Build for production
- `npm run build:github` - Build for GitHub Pages
- `npm run build:vercel` - Build for Vercel
- `npm run analyze` - Analyze bundle size

### Deployment
- `npm run deploy:github` - Deploy to GitHub Pages
- `npm run deploy:vercel` - Deploy to Vercel

### Code Quality
- `npm run lint` - Run ESLint
- `npm run lint:fix` - Fix ESLint issues
- `npm run format` - Format code with Prettier
- `npm run format:check` - Check code formatting
- `npm run type-check` - Run TypeScript type checking

### Maintenance
- `npm run clean` - Clean build directories
- `npm run clean:install` - Clean install dependencies

## 🌐 Deployment

### GitHub Pages

1. **Automatic Deployment** (Recommended)
   - Push to main branch triggers automatic deployment via GitHub Actions

2. **Manual Deployment**
   ```bash
   npm run deploy:github
   ```

### Vercel

1. **Automatic Deployment** (Recommended)
   - Connect your GitHub repository to Vercel for automatic deployments

2. **Manual Deployment**
   ```bash
   npm run deploy:vercel
   ```

3. **GitHub Actions**
   - Set up the following secrets in your repository:
     - `VERCEL_TOKEN`: Your Vercel API token
     - `VERCEL_ORG_ID`: Your Vercel organization ID
     - `VERCEL_PROJECT_ID`: Your Vercel project ID

## 🔧 Configuration

### Environment Variables

Create a `.env` file based on `.env.example`:

```env
NODE_ENV=development
VITE_APP_NAME=Recipe Generator
VITE_APP_VERSION=1.0.0
DEPLOY_TARGET=vercel  # or 'github' for GitHub Pages
```

### Build Configuration

The project automatically detects the deployment target:
- **GitHub Pages**: Uses `/Recipe-Generator/` base path
- **Vercel**: Uses `/` base path
- **Custom**: Set `DEPLOY_TARGET` environment variable

## 📁 Project Structure

```
src/
├── api/              # API services
├── assets/           # Static assets (images, fonts)
├── components/       # React components
│   ├── layout/       # Layout components
│   ├── recipe/       # Recipe-specific components
│   └── ui/           # Reusable UI components
├── hooks/            # Custom React hooks
├── pages/            # Page components
└── styles/           # Global styles
```

## 🎨 Customization

### Color Palette

The project uses a modern color scheme:
- **Primary**: Emerald (green tones)
- **Secondary**: Amber (yellow/orange tones)
- **Neutral**: Slate (gray tones)

To customize colors, edit `src/index.css`.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🔗 Links

- **Live Demo**: [https://your-vercel-app.vercel.app](https://your-vercel-app.vercel.app)
- **GitHub Pages**: [https://yourusername.github.io/Recipe-Generator](https://yourusername.github.io/Recipe-Generator)

---

Made with ❤️ using React, Vite, and Tailwind CSS
