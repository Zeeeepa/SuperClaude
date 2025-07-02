# SuperClaude Test Command

**Purpose**: Comprehensive testing framework with coverage analysis, quality assurance, and automated testing strategies.

## Activation
This rule activates when:
- User mentions "SuperClaude test" or "superclaude test"
- Requests for test creation, test strategy, or quality assurance
- Testing automation, coverage analysis, or test optimization

## Testing Strategies

### Test-Driven Development (TDD)
- **Red-Green-Refactor**: Write failing test → Make it pass → Improve code
- **Test First**: Define behavior through tests before implementation
- **Incremental Development**: Small, focused test cases driving design
- **Regression Prevention**: Ensure new changes don't break existing functionality

### Behavior-Driven Development (BDD)
- **Given-When-Then**: Structured test scenarios in natural language
- **Specification by Example**: Concrete examples defining system behavior
- **Collaboration**: Business, development, and QA alignment
- **Living Documentation**: Tests as executable specifications

### Testing Pyramid
- **Unit Tests (70%)**: Fast, isolated, focused on single components
- **Integration Tests (20%)**: Component interactions, API contracts
- **End-to-End Tests (10%)**: Full user workflows, critical paths
- **Manual Testing**: Exploratory, usability, edge cases

## Test Types and Implementation

### Unit Testing
- **Frameworks**: Jest, Vitest, Mocha, Jasmine, pytest, JUnit
- **Mocking**: Mock external dependencies, isolate units under test
- **Assertions**: Clear, descriptive test assertions
- **Test Data**: Fixtures, factories, builders for test data
- **Coverage**: Line, branch, function, statement coverage metrics

### Integration Testing
- **API Testing**: REST/GraphQL endpoint testing, contract testing
- **Database Testing**: Data access layer, transaction handling
- **Service Integration**: External service mocking, contract verification
- **Message Queue Testing**: Event-driven architecture testing
- **Configuration Testing**: Environment-specific configuration validation

### End-to-End Testing
- **Browser Automation**: Playwright, Cypress, Selenium WebDriver
- **Mobile Testing**: Appium, Detox for React Native
- **API Workflows**: Complete user journey testing
- **Cross-Browser Testing**: Compatibility across different browsers
- **Performance Testing**: Load testing, stress testing, endurance testing

### Specialized Testing

**Security Testing**
- **OWASP Testing**: Injection, authentication, authorization vulnerabilities
- **Penetration Testing**: Automated and manual security testing
- **Dependency Scanning**: Known vulnerability detection
- **Static Analysis**: Security-focused code analysis

**Performance Testing**
- **Load Testing**: Normal expected load simulation
- **Stress Testing**: Beyond normal capacity testing
- **Spike Testing**: Sudden load increase handling
- **Volume Testing**: Large amounts of data processing
- **Endurance Testing**: Extended period performance

**Accessibility Testing**
- **WCAG Compliance**: Web Content Accessibility Guidelines
- **Screen Reader Testing**: Assistive technology compatibility
- **Keyboard Navigation**: Full keyboard accessibility
- **Color Contrast**: Visual accessibility requirements

## Test Quality and Maintenance

### Test Design Principles
- **FIRST**: Fast, Independent, Repeatable, Self-validating, Timely
- **AAA Pattern**: Arrange, Act, Assert structure
- **Descriptive Names**: Clear test purpose and expected behavior
- **Single Responsibility**: One concept per test case
- **Test Data Management**: Isolated, predictable test data

### Coverage Analysis
- **Code Coverage**: Line, branch, function coverage metrics
- **Mutation Testing**: Test quality assessment through code mutations
- **Coverage Goals**: Realistic targets based on risk assessment
- **Coverage Reports**: Visual reports, trend analysis, CI integration

### Test Maintenance
- **Flaky Test Management**: Identify and fix unreliable tests
- **Test Refactoring**: Improve test maintainability and readability
- **Test Documentation**: Clear test purpose and maintenance notes
- **Test Data Cleanup**: Proper setup and teardown procedures

## CI/CD Integration

### Automated Testing Pipeline
- **Pre-commit Hooks**: Run fast tests before code commit
- **Pull Request Testing**: Comprehensive test suite on PR creation
- **Deployment Testing**: Smoke tests, health checks post-deployment
- **Scheduled Testing**: Regular regression testing, performance monitoring

### Test Reporting
- **Test Results**: Pass/fail status, execution time, coverage metrics
- **Trend Analysis**: Test stability, performance trends over time
- **Failure Analysis**: Root cause analysis, failure categorization
- **Quality Gates**: Minimum coverage, maximum failure thresholds

## Testing Tools and Frameworks

### JavaScript/TypeScript
- **Unit**: Jest, Vitest, Mocha + Chai
- **E2E**: Playwright, Cypress, Puppeteer
- **React**: React Testing Library, Enzyme
- **API**: Supertest, Postman/Newman

### Python
- **Unit**: pytest, unittest, nose2
- **Web**: Selenium, Playwright for Python
- **API**: requests, httpx, pytest-httpx
- **Mocking**: unittest.mock, pytest-mock

### Quality Assurance
- **Static Analysis**: ESLint, Pylint, SonarQube
- **Type Checking**: TypeScript, mypy, Flow
- **Code Formatting**: Prettier, Black, gofmt
- **Security**: Snyk, OWASP Dependency Check

## Evidence-Based Testing
- Use industry-standard testing frameworks and practices
- Reference testing best practices and guidelines
- Implement proven testing patterns and strategies
- Measure and report on testing effectiveness

---
*Example: "Use SuperClaude test to create a comprehensive testing strategy for this React application with Jest and Playwright"*

