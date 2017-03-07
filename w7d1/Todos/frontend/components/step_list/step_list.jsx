import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';
const StepList = ({steps, todoID, receiveStep, receiveSteps, removeStep}) => (
  <div className="step-list">
    <StepForm removeStep={removeStep} receiveStep={receiveStep} todoID={todoID}/>
    <ul>
      {steps.map(step =>
        <StepListItemContainer
          key={step.id}
          step={step}
          removeStep={removeStep}
          receiveStep={receiveStep}
        />)}
    </ul>
  </div>
);

export default StepList;
