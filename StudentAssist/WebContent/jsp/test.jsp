<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>



<html>

<div class="tree">
		<ul>
			<li>
				<a  class="node" href="#">Rob</a><a  class="node" href="#">Jane</a>
				<ul>
					<li>
						<a  class="node" href="#">Robert</a>
					</li>
					<li>
						<a   class="node"href="#">robbie</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>

</html>

<script>

var siblingNode='<li>'+
'<a class="node"  href="#">added Node</a>'+
'</li>';

var parentNode=
'<a class="node"  href="#">parent RootNode</a>';



$('.tree').find('.node').each(function(index) {

			if($(this).text()=='Rob')
				{
				

			// code to insert sibling
			   //$(siblingNode).insertAfter($(this).parent()); 
			
			// insert parent to person

			// insert parent if the child is not root node
				//$(this).parent().parent().parent().prepend($(parentNode));
			
			// insert parent if child is root node
			//	$('.tree').children().wrap("<ul><li></li></ul>");
			//	$('.tree').children().children().prepend($(parentNode));
			

			
			
			
			
		}

	});
</script>

<style>

<style type="text/css" media="screen">
		* {margin: 0; padding: 0;}

		.tree ul {
			padding-top: 20px; position: relative;
	
			-webkit-transition: all 0.5s;
			-moz-transition: all 0.5s;
			transition: all 0.5s;
		}

		.tree li {
			float: left; text-align: center;
			list-style-type: none;
			position: relative;
			padding: 20px 5px 0 5px;
	
			-webkit-transition: all 0.5s;
			-moz-transition: all 0.5s;
			transition: all 0.5s;
		}

		/*We will use ::before and ::after to draw the connectors*/

		.tree li::before, .tree li::after{
			content: '';
			position: absolute; top: 0; right: 50%;
			border-top: 1px solid #ccc;
			width: 50%; height: 45px;
			z-index: -1;
		}
		.tree li::after{
			right: auto; left: 50%;
			border-left: 1px solid #ccc;
		}

		/*We need to remove left-right connectors from elements without 
		any siblings*/
		.tree li:only-child::after, .tree li:only-child::before {
			display: none;
		}

		/*Remove space from the top of single children*/
		.tree li:only-child{ padding-top: 0;}

		/*Remove left connector from first child and 
		right connector from last child*/
		.tree li:first-child::before, .tree li:last-child::after{
			border: 0 none;
		}
		/*Adding back the vertical connector to the last nodes*/
		.tree li:last-child::before{
			border-right: 1px solid #ccc;
			border-radius: 0 5px 0 0;
			
			-webkit-transform: translateX(1px);
			-moz-transform: translateX(1px);
			transform: translateX(1px);
			
			-webkit-border-radius: 0 5px 0 0;
			-moz-border-radius: 0 5px 0 0;
			border-radius: 0 5px 0 0;
		}
		.tree li:first-child::after{
			border-radius: 5px 0 0 0;
			-webkit-border-radius: 5px 0 0 0;
			-moz-border-radius: 5px 0 0 0;
		}

		/*Time to add downward connectors from parents*/
		.tree ul ul::before{
			content: '';
			position: absolute; top: -12px; left: 50%;
			border-left: 1px solid #ccc;
			width: 0; height: 32px;
			z-index: -1;
		}

		.tree li a{
			border: 1px solid #ccc;
			padding: 5px 10px;
			text-decoration: none;
			color: #666;
			font-family: arial, verdana, tahoma;
			font-size: 11px;
			display: inline-block;
			background: white;
	
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
	
			-webkit-transition: all 0.5s;
			-moz-transition: all 0.5s;
			transition: all 0.5s;
		}
		.tree li a+a {
			margin-left: 20px;
			position: relative;
		}
		.tree li a+a::before {
			content: '';
			position: absolute;
			border-top: 1px solid #ccc;
			top: 50%; left: -21px; 
			width: 20px;
		}

		/*Time for some hover effects*/
		/*We will apply the hover effect the the lineage of the element also*/
		.tree li a:hover, .tree li a:hover~ul li a {
			background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
		}
		/*Connector styles on hover*/
		.tree li a:hover~ul li::after, 
		.tree li a:hover~ul li::before, 
		.tree li a:hover~ul::before, 
		.tree li a:hover~ul ul::before
		{
			border-color: #94a0b4;
		}
	</style>

</style>