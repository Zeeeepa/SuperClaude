# SuperClaude Build Command

**Purpose**: Universal project builder with stack templates and modern development practices.

## Activation
This rule activates when:
- User mentions "SuperClaude build" or "superclaude build"
- Requests for project creation, feature building, or development setup
- Building React apps, APIs, full-stack applications, or CLI tools

## Command Behavior

### Pre-Build Checklist
- Remove artifacts (dist/, build/, .next/)
- Clean temporary files and cache
- Validate dependencies
- Remove debug code and console logs

### Build Modes

**Project Initialization (`--init` or "new project")**
- Create new project with selected stack
- TypeScript by default
- Testing setup included
- Git workflow configuration
- Modern tooling setup

**Feature Development (`--feature` or "add feature")**
- Implement feature following existing patterns
- Maintain code consistency
- Include comprehensive tests
- Follow established architecture

**Test-Driven Development (`--tdd` or "test-driven")**
- Write failing tests first
- Implement minimal code to pass tests
- Refactor for quality
- Maintain test coverage

### Technology Templates

**React Stack**
- Vite + TypeScript + React Router
- State management (Zustand/Redux Toolkit)
- Testing setup (Jest + React Testing Library)
- ESLint + Prettier configuration
- Modern CSS solution (Tailwind/Styled Components)

**API Stack**
- Express + TypeScript
- Authentication middleware
- Input validation (Zod)
- OpenAPI documentation
- Database integration (PostgreSQL/MongoDB)

**Full-Stack Template**
- React frontend + Node.js backend
- Docker configuration
- Database setup
- API integration
- Deployment configuration

**Mobile Template**
- React Native + Expo
- Navigation setup
- State management
- Testing configuration
- Platform-specific optimizations

**CLI Template**
- Commander.js framework
- Configuration management
- Testing setup
- Documentation generation
- Cross-platform compatibility

### Advanced Options

**Watch Mode (`--watch` or "continuous build")**
- Real-time file monitoring
- Incremental compilation
- Live reload functionality
- Error reporting

**Interactive Mode (`--interactive` or "step-by-step")**
- Guided configuration process
- Interactive dependency selection
- Custom build options
- Real-time feedback

## Evidence-Based Practices
- Use documented best practices for each technology
- Reference official documentation for setup procedures
- Implement proven architectural patterns
- Include performance benchmarks where applicable

## Quality Standards
- All generated code follows modern standards
- Comprehensive error handling
- Security best practices implemented
- Performance optimizations included
- Accessibility considerations (for frontend)

## Git Integration
- Initialize repository if needed
- Create appropriate .gitignore
- Set up branch protection rules
- Configure commit hooks (pre-commit, pre-push)
- Create initial commit with proper message

## Output Organization
- Clear project structure
- Documented file organization
- README with setup instructions
- Contributing guidelines
- License and security information

---
*Example: "Use SuperClaude build to create a React TypeScript app with testing setup"*

