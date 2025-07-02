# SuperClaude Review Command

**Purpose**: AI-powered code review with evidence-based recommendations, quality assessment, and comprehensive analysis.

## Activation
This rule activates when:
- User mentions "SuperClaude review" or "superclaude review"
- Requests for code review, quality assessment, or peer review
- Pull request reviews, code quality analysis, or best practices evaluation

## Review Methodology

### Evidence-Based Analysis
- **Quantitative Metrics**: Cyclomatic complexity, code coverage, performance benchmarks
- **Qualitative Assessment**: Readability, maintainability, architectural alignment
- **Industry Standards**: Reference established best practices and guidelines
- **Documentation Requirements**: All recommendations backed by evidence and sources

### Review Scope

**Code Quality Review**
- **Structure**: File organization, module dependencies, separation of concerns
- **Patterns**: Design patterns usage, anti-patterns identification
- **Standards**: Coding conventions, style consistency, naming conventions
- **Complexity**: Cognitive load, cyclomatic complexity, nesting levels
- **Duplication**: Code reuse opportunities, DRY principle adherence

**Security Review**
- **Vulnerabilities**: OWASP Top 10, common security flaws
- **Authentication**: Access controls, session management, authorization
- **Input Validation**: Sanitization, parameterized queries, encoding
- **Data Protection**: Encryption, sensitive data handling, privacy compliance
- **Dependencies**: Third-party library vulnerabilities, license compliance

**Performance Review**
- **Algorithmic Efficiency**: Time and space complexity analysis
- **Resource Usage**: Memory consumption, CPU utilization, I/O operations
- **Optimization Opportunities**: Caching, lazy loading, database queries
- **Scalability**: Horizontal and vertical scaling considerations
- **Monitoring**: Performance metrics, alerting, observability

**Architecture Review**
- **Design Principles**: SOLID principles, clean architecture, domain-driven design
- **Component Relationships**: Coupling, cohesion, dependency management
- **Scalability**: Growth patterns, performance limits, resource requirements
- **Maintainability**: Code organization, documentation, testing strategy
- **Integration**: API design, data consistency, service boundaries

## Review Process

### Automated Analysis
- **Static Code Analysis**: ESLint, SonarQube, CodeClimate integration
- **Security Scanning**: Snyk, OWASP Dependency Check, Bandit
- **Performance Profiling**: Lighthouse, WebPageTest, application profilers
- **Test Coverage**: Jest, pytest, coverage.py analysis
- **Documentation**: JSDoc, Sphinx, automated documentation generation

### Manual Review
- **Code Walkthrough**: Line-by-line analysis of critical sections
- **Architecture Assessment**: High-level design and pattern evaluation
- **Business Logic**: Domain knowledge and requirement alignment
- **Edge Cases**: Error handling, boundary conditions, failure scenarios
- **User Experience**: Frontend usability, accessibility, performance

### Collaborative Review
- **Peer Review**: Multiple reviewer perspectives and expertise
- **Domain Expert Input**: Subject matter expert validation
- **Stakeholder Feedback**: Business requirement alignment
- **Team Standards**: Consistency with team practices and conventions

## Review Deliverables

### Review Report Structure
```
## Executive Summary
- Overall assessment and key findings
- Critical issues requiring immediate attention
- Recommendations priority matrix

## Detailed Analysis
### Code Quality (Score: X/10)
- Specific findings with code examples
- Improvement recommendations
- Best practice references

### Security Assessment (Score: X/10)
- Vulnerability identification
- Risk assessment and mitigation
- Compliance requirements

### Performance Analysis (Score: X/10)
- Bottleneck identification
- Optimization opportunities
- Scalability considerations

### Architecture Evaluation (Score: X/10)
- Design pattern assessment
- Structural improvements
- Long-term maintainability

## Action Items
1. Critical fixes (Priority: HIGH)
2. Quality improvements (Priority: MEDIUM)
3. Enhancement opportunities (Priority: LOW)

## References
- Industry standards and best practices
- Documentation and guidelines
- Tools and resources
```

### Severity Classification
- **CRITICAL**: Security vulnerabilities, data loss risks, system failures
- **HIGH**: Performance issues, maintainability problems, significant bugs
- **MEDIUM**: Code quality improvements, minor security concerns, optimization
- **LOW**: Style inconsistencies, documentation gaps, enhancement suggestions

### Recommendation Format
- **Issue Description**: Clear problem statement with evidence
- **Impact Assessment**: Business and technical impact analysis
- **Proposed Solution**: Specific, actionable recommendations
- **Implementation Guide**: Step-by-step improvement instructions
- **Validation Criteria**: How to verify the fix is successful

## Quality Gates

### Pre-Review Checklist
- [ ] Code compiles without errors or warnings
- [ ] All tests pass with adequate coverage (>80%)
- [ ] Security scan shows no critical vulnerabilities
- [ ] Performance benchmarks meet requirements
- [ ] Documentation is complete and accurate

### Review Completion Criteria
- [ ] All critical and high-priority issues addressed
- [ ] Security vulnerabilities resolved or accepted
- [ ] Performance requirements validated
- [ ] Code quality standards met
- [ ] Documentation updated and reviewed

## Integration with Development Workflow

### Pull Request Integration
- Automated review triggers on PR creation
- Review comments linked to specific code lines
- Approval gates based on review outcomes
- Integration with CI/CD pipeline

### Continuous Improvement
- Review metrics tracking and analysis
- Team learning from review findings
- Process refinement based on outcomes
- Knowledge sharing and best practice updates

---
*Example: "Use SuperClaude review with security persona to perform comprehensive code review of this authentication module"*

