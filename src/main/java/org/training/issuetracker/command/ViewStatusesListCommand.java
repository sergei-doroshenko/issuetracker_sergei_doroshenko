package org.training.issuetracker.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.training.issuetracker.constants.Constants;
import org.training.issuetracker.data.db.PropImplDB.PropertyType;
import org.training.issuetracker.domain.AbstractPersistentObj;
import org.training.issuetracker.domain.Issue;
import org.training.issuetracker.domain.User;
import org.training.issuetracker.domain.DAO.DAOFactory;
import org.training.issuetracker.domain.DAO.PropDAO;
import org.training.issuetracker.exceptions.DaoException;
import org.training.issuetracker.exceptions.ParameterNotFoundException;
import org.training.issuetracker.security.PermissionInspector;
import org.training.issuetracker.utils.JqGridData;
import org.training.issuetracker.utils.ParameterParser;

public class ViewStatusesListCommand extends AbstractWebCommand {
	private Logger logger = Logger.getLogger("org.training.issuetracker.command");
	
	public ViewStatusesListCommand(HttpServletRequest request,	HttpServletResponse response) {
		super(request, response);
	}

	@Override
	public void execute() throws IOException, ServletException {
		getResponse().setContentType(MediaType.APPLICATION_JSON);
		PrintWriter out = getResponse().getWriter();
		User user = (User) getRequest().getSession().getAttribute(Constants.KEY_USER);
		
		PermissionInspector.checkPermission(user, this.getClass().getSimpleName());
		ParameterParser parser = new ParameterParser(getRequest());
		PropDAO propDAO = DAOFactory.getDAO(PropDAO.class);
		try {
			int page = parser.getIntParameter(Constants.KEY_PAGE);
			List<AbstractPersistentObj> statuses = propDAO.getPropList(PropertyType.STATUS);
			logger.debug("Prop List = " + statuses);
			
			int total = statuses.size();
			int records = statuses.size();
			
			JqGridData<AbstractPersistentObj> data = new JqGridData<>(total, page, records, statuses);
			String json = data.getJsonString();
			logger.debug(json);
			out.print(json);
		} catch (DaoException | ParameterNotFoundException e) {
			e.printStackTrace();
			out.print(e.getMessage());
			getResponse().setStatus(HttpServletResponse.SC_BAD_REQUEST);
		} finally {
			out.flush();
			out.close();
		}
	}
}
