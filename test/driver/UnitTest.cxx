/*
 * UnitTest.cpp
 *
 *  Created on: 2016/05/13
 *      Author: boxil
 */

#include "sample.h"
#include <gtest/gtest.h>

namespace bxl_driver{

	class UnitTest : public ::testing::Test {
	protected:
		virtual void SetUp() {
		}

		virtual void TearDown() {
		}
	};

	TEST_F( UnitTest , HogeNormal ) {
		ASSERT_TRUE(bxl_utils::sample());
	}

}
