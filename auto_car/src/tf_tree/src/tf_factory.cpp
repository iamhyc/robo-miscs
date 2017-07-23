#include <tf_tree/tf_factory.h>

namespace autocar
{
	namespace tf_mul
	{
		tf_factory::tf_factory()
		{
		}

		void tf_factory::create_tf()
		{
		  //base_link---->lidar
		  quaternion = new tf::Quaternion(0, 0, 0, 1);//rotation
		  trans      = new tf::Vector3(-0.1, 0.0, 0.1);//translation
		}

		tf::Vector3 tf_factory::get_transf()
		{
		  return *trans;
		}

		tf::Quaternion tf_factory::get_rotate()
		{
		  return *quaternion;
		}
	}
}
