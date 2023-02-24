// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

// (c) Copyright 2018 - 2019 Xilinx, Inc. All rights reserved.
//

// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.

#ifndef XILINX_XSIM_CONSTRAINT_STACK_H
#define XILINX_XSIM_CONSTRAINT_STACK_H

#include <vector>
#include <cassert>

namespace Xilinx_xsim {

/**
 * Stack for resolving inner unconstrained types
 */
template <typename Constraint>
class ConstraintStack
{
public:
  ~ConstraintStack() {
    while(!m_s.empty())
    pop(false);
  }
  
  void push(const std::vector<Constraint>& constrVector) {
    Frame* pFrame = new Frame(constrVector);
    m_s.push_back(pFrame);
  }

  void push(const Constraint* constrPtr, unsigned length) {
    Frame* pFrame = new Frame(constrPtr, length);
    m_s.push_back(pFrame);
  }

  void pop(bool checkAssertion = true) {
    assert(!m_s.empty());
    Frame* top = m_s.back();
    if(checkAssertion)
        assert(top->isConsumed());
    m_s.pop_back();
    delete top;
  }

  const Constraint getConstraint() {
    assert(!m_s.empty());
    for(int i=m_s.size()-1; i>=0; --i) {
      Frame* pFrame = m_s[i];
      const Constraint& crtConstr = pFrame->getNext();
      if (crtConstr)
        return crtConstr;
    }
    assert(!"xsimConstraintStack.h getConstraints: No proper constraints on the constraints stack");
    
    static Constraint dummy; //if it reaches here, something has gone wrong anyway
    return dummy; //reference to static to shut up coverity (and the warnings)
  }
  
  void replace(const Constraint& newConstraint)
  {
    assert(!m_s.empty());
    for(int i=m_s.size()-1; i>=0; --i) {
      Frame* pFrame = m_s[i];
      if(pFrame->replaceCurrent(newConstraint))
        return;
    }
    assert(!"From replace: No proper constraints on the constraints stack");
  }

  bool isEmpty() const { return m_s.empty(); }
  
private:
  class Frame
  {
  public:
      explicit Frame(const std::vector<Constraint>& constrVector): m_curIndex(0), m_v(constrVector) {}
      
      Frame(const Constraint* constrPtr, unsigned length): m_curIndex(0) {
        for(unsigned i=0; i<length; ++i)
          m_v.push_back(constrPtr[i]);
      }
      
      const Constraint& getNext() {
        assert(!isConsumed());
        return m_v[m_curIndex++]; //care required: reference to an element of a vector: no re-sizing
      }
      
      bool replaceCurrent(const Constraint& newConstr) {
        assert(!isConsumed());
        if(!m_v[m_curIndex])
          return false; //no replacement done
        m_v[m_curIndex] = newConstr;
        return true; //replacement done successfully
      }
      
      bool isConsumed() const { return m_curIndex == m_v.size(); }
  private:
      unsigned m_curIndex;
      std::vector<Constraint> m_v;
  };

  std::vector<Frame*> m_s;
};


} // namespace Xilinx_xsim

#endif // XILINX_XSIM_CONSTRAINT_STACK_H

