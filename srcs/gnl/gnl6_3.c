/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl1_1.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jgigault <jgigault@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/10 09:42:43 by jgigault          #+#    #+#             */
/*   Updated: 2014/12/30 12:28:58 by jgigault         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include "gnl.h"

int				main(int argc, char **argv)
{
	char		*line;
	int			fd;
	int			ret;
	int			count;
	char		*filename;
	int			errors;

	filename = "./srcs/gnl/gnl5_3.txt";
	fd = 0;
	if (argc && argv)
	{
		count = 0;
		errors = 0;
		line = NULL;
		while ((ret = get_next_line(fd, &line)) > 0)
		{
			if (count == 0 && strcmp(line, "123") != 0)
				errors++;
			if (count == 1 && strcmp(line, "abc") != 0)
				errors++;
			if (count == 2 && strcmp(line, "456") != 0)
				errors++;
			if (count == 3 && strcmp(line, "def") != 0)
				errors++;
			count++;
		}
		if (count == 3)
		{
			if (strcmp(line, "def") != 0)
				errors++;
			else
				count++;
		}
		if (count != 4)
			errors++;
		if (errors > 0)
		{
			printf("%d lines read | %d error(s)", count, errors);
		}
		else
		{
			printf("OK");
		}
	}
	else
	{
		printf("An error occured while reading file %s through STDIN", filename);
	}
	return (0);
}
