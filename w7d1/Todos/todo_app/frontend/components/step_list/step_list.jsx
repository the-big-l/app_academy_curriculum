import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';
const StepList = ({steps, todoID, createStep, updateStep, destroyStep}) => (
  <div className="step-list">
    <StepForm createStep={createStep} todoID={todoID}/>
    <ul>
      {steps.map(step =>
        <StepListItemContainer
          key={step.id}
          step={step}
          destroyStep={destroyStep}
          updateStep={updateStep}
        />)}
    </ul>
  </div>
);

export default StepList;
