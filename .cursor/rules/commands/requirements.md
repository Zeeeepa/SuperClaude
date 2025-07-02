# SuperClaude Requirements Command

**Purpose**: Intelligent requirements gathering, analysis, and documentation system for software projects with stakeholder alignment and traceability.

## Activation
This rule activates when:
- User mentions "SuperClaude requirements" or "superclaude requirements"
- Requests for requirements gathering, analysis, or documentation
- Business analysis, user story creation, or project specification tasks

## Requirements Engineering Methodology

### Requirements Lifecycle Management
- **Elicitation**: Stakeholder interviews, workshops, observation, prototyping
- **Analysis**: Conflict resolution, prioritization, feasibility assessment
- **Specification**: Clear, testable, traceable requirements documentation
- **Validation**: Stakeholder review, acceptance criteria verification
- **Management**: Change control, traceability, version management

### Requirements Types

**Functional Requirements**
- **User Stories**: As a [user], I want [goal] so that [benefit]
- **Use Cases**: Detailed interaction scenarios between actors and system
- **Business Rules**: Constraints, policies, and regulations
- **Data Requirements**: Information structure, relationships, constraints
- **Interface Requirements**: API specifications, UI/UX requirements

**Non-Functional Requirements**
- **Performance**: Response time, throughput, scalability targets
- **Security**: Authentication, authorization, data protection, compliance
- **Usability**: User experience, accessibility, internationalization
- **Reliability**: Availability, fault tolerance, disaster recovery
- **Maintainability**: Code quality, documentation, testing requirements

**System Requirements**
- **Technical Constraints**: Platform, technology stack, integration requirements
- **Operational Requirements**: Deployment, monitoring, backup, maintenance
- **Legal/Compliance**: GDPR, HIPAA, SOX, industry-specific regulations
- **Business Constraints**: Budget, timeline, resource limitations

## Requirements Gathering Techniques

### Stakeholder Analysis
- **Primary Stakeholders**: End users, customers, product owners
- **Secondary Stakeholders**: IT operations, support teams, compliance
- **Key Stakeholders**: Executives, decision makers, budget holders
- **Influence Mapping**: Power vs. interest matrix, communication strategies

### Elicitation Methods
- **Interviews**: Structured, semi-structured, unstructured approaches
- **Workshops**: JAD sessions, focus groups, brainstorming
- **Observation**: Job shadowing, workflow analysis, ethnographic studies
- **Document Analysis**: Existing systems, business processes, regulations
- **Prototyping**: Mockups, wireframes, proof of concepts

### Requirements Analysis Framework

**MoSCoW Prioritization**
- **Must Have**: Critical requirements for minimum viable product
- **Should Have**: Important but not critical for initial release
- **Could Have**: Nice-to-have features for future iterations
- **Won't Have**: Explicitly excluded from current scope

**SMART Criteria**
- **Specific**: Clear, unambiguous requirement statements
- **Measurable**: Quantifiable acceptance criteria
- **Achievable**: Technically and practically feasible
- **Relevant**: Aligned with business objectives
- **Time-bound**: Clear delivery expectations

## Requirements Documentation Structure

### Business Requirements Document (BRD)
```
## Executive Summary
- Project overview and business justification
- Key stakeholders and success criteria
- High-level scope and constraints

## Business Objectives
- Strategic goals and KPIs
- Success metrics and measurement criteria
- Return on investment expectations

## Stakeholder Analysis
- Stakeholder identification and roles
- Communication plan and approval process
- Conflict resolution procedures

## Functional Requirements
- User stories with acceptance criteria
- Use case diagrams and scenarios
- Business rules and data requirements

## Non-Functional Requirements
- Performance and scalability requirements
- Security and compliance requirements
- Usability and accessibility standards

## Constraints and Assumptions
- Technical constraints and dependencies
- Budget and timeline limitations
- Risk assessment and mitigation strategies
```

### Technical Requirements Specification (TRS)
```
## System Architecture
- High-level system design
- Component interactions and interfaces
- Technology stack and platform requirements

## Functional Specifications
- Detailed feature descriptions
- API specifications and data models
- Integration requirements and protocols

## Quality Attributes
- Performance benchmarks and targets
- Security requirements and standards
- Reliability and availability requirements

## Implementation Guidelines
- Coding standards and best practices
- Testing requirements and strategies
- Deployment and operational procedures
```

### User Story Templates

**Epic Template**
```
Epic: [Epic Name]
Description: [High-level feature description]
Business Value: [Why this epic is important]
Acceptance Criteria:
- [ ] [High-level acceptance criterion 1]
- [ ] [High-level acceptance criterion 2]
User Stories: [List of related user stories]
```

**User Story Template**
```
Story: [Story Title]
As a [user role]
I want [functionality]
So that [business value]

Acceptance Criteria:
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]

Definition of Done:
- [ ] Code implemented and reviewed
- [ ] Unit tests written and passing
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Stakeholder acceptance obtained
```

## Requirements Traceability

### Traceability Matrix
- **Forward Traceability**: Business needs → Requirements → Design → Implementation → Testing
- **Backward Traceability**: Test cases → Implementation → Design → Requirements → Business needs
- **Bidirectional Traceability**: Complete linkage in both directions

### Change Management
- **Impact Analysis**: Assess effects of requirement changes
- **Change Control Board**: Approval process for requirement modifications
- **Version Control**: Track requirement evolution over time
- **Communication**: Notify stakeholders of approved changes

## Requirements Validation Techniques

### Review Methods
- **Formal Inspections**: Structured review process with defined roles
- **Walkthroughs**: Author-led review sessions
- **Peer Reviews**: Collaborative examination by team members
- **Stakeholder Reviews**: Business user validation sessions

### Validation Criteria
- **Completeness**: All necessary requirements captured
- **Consistency**: No conflicting requirements
- **Clarity**: Unambiguous and understandable
- **Testability**: Verifiable acceptance criteria
- **Feasibility**: Technically and economically viable

## Tools and Templates

### Requirements Management Tools
- **Jira**: User story management and tracking
- **Azure DevOps**: Requirements lifecycle management
- **Confluence**: Documentation and collaboration
- **Figma/Sketch**: UI/UX requirements and prototyping
- **Lucidchart**: Process flows and system diagrams

### Documentation Templates
- **Business Requirements Document (BRD)**
- **Technical Requirements Specification (TRS)**
- **User Story Templates with Acceptance Criteria**
- **Requirements Traceability Matrix**
- **Stakeholder Analysis Template**

## Quality Assurance

### Requirements Quality Checklist
- [ ] Requirements are clear and unambiguous
- [ ] Each requirement is testable and verifiable
- [ ] Requirements are prioritized using MoSCoW method
- [ ] Acceptance criteria are specific and measurable
- [ ] Stakeholder approval is documented
- [ ] Traceability links are established
- [ ] Non-functional requirements are specified
- [ ] Constraints and assumptions are documented

### Best Practices
- **Involve stakeholders early and often**
- **Use visual models and prototypes**
- **Maintain requirements traceability**
- **Implement change control processes**
- **Validate requirements continuously**
- **Document assumptions and constraints**
- **Prioritize requirements based on business value**

## Integration with Development Process

### Agile Integration
- **Product Backlog**: Prioritized list of user stories
- **Sprint Planning**: Story estimation and commitment
- **Definition of Ready**: Criteria for story development
- **Definition of Done**: Completion criteria for stories

### DevOps Integration
- **Continuous Requirements**: Ongoing stakeholder feedback
- **Automated Testing**: Requirements-based test automation
- **Deployment Criteria**: Requirements-driven release decisions
- **Monitoring**: Requirements satisfaction measurement

---
*Example: "Use SuperClaude requirements to gather and document functional requirements for this e-commerce platform with stakeholder analysis"*

